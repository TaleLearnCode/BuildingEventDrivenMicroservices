CareManagementContext _careManagementContext = GetCareManagementContext();
ResidentManagementContext _residentManagementContext = GetResidentManagementContext();

DisplayHeader();

do
{
	Console.WriteLine();
	if (TryGetCaree(GetNumericInput("Caree Id: "), out Caree? caree) && caree is not null)
	{

		Console.WriteLine();
		Console.WriteLine($"\tCaree: {caree.FirstName} {caree.MiddleName} {caree.LastName}");
		Console.WriteLine($"\tCare Type: {caree.CareType.CareTypeName} ({caree.CareTypeId})");
		Console.WriteLine();
		int careTypeId = GetNumericInput("Care Type Id: ");
		int roomRate = GetNumericInput("Room Rate: ");

		caree.CareTypeId = careTypeId;
		_careManagementContext.Carees.Update(caree);
		await _careManagementContext.SaveChangesAsync();

		ResidentCareTypeChange? residentCareTypeChange = await BuildMessageAsync(caree.CareeId, careTypeId, roomRate);
		if (residentCareTypeChange is not null)
			await SendMessageAsync(residentCareTypeChange);

	}
} while (true);

int GetNumericInput(string prompt)
{
	Console.Write(prompt);
	string? input = Console.ReadLine();
	if (input is not null && int.TryParse(input, out int result))
		return result;
	else
		return 0;

}

bool TryGetCaree(int careeId, out Caree? caree)
{
	caree = _careManagementContext.Carees
		.Include(x => x.CareType)
		.FirstOrDefault(x => x.CareeId == careeId);
	return (caree is not null);
}

async Task<ResidentCareTypeChange?> BuildMessageAsync(int residentId, int careTypeId, int roomRate)
{
	Resident? resident = await _residentManagementContext.Residents
		.Include(x => x.ResidentRooms)
		.FirstOrDefaultAsync(x => x.ResidentId == residentId);
	if (resident is not null && resident.ResidentRooms is not null && resident.ResidentRooms.Any())
	{
		return new()
		{
			ResidentId = residentId,
			RoomId = resident.ResidentRooms.First().RoomId,
			CareTypeId = careTypeId,
			RoomRate = roomRate
		};
	}
	else
		return default;
}

void DisplayHeader()
{
	Console.ForegroundColor = ConsoleColor.Green;
	Console.WriteLine(@" ____ ___                                 .___       _________                       ");
	Console.WriteLine(@"|    |   \______   ________________     __| _/____   \_   ___ \_____ _______   ____  ");
	Console.WriteLine(@"|    |   /\____ \ / ___\_  __ \__  \   / __ |/ __ \  /    \  \/\__  \\_  __ \_/ __ \ ");
	Console.WriteLine(@"|    |  / |  |_> > /_/  >  | \// __ \_/ /_/ \  ___/  \     \____/ __ \|  | \/\  ___/ ");
	Console.WriteLine(@"|______/  |   __/\___  /|__|  (____  /\____ |\___  >  \______  (____  /__|    \___  >");
	Console.WriteLine(@"          |__|  /_____/            \/      \/    \/          \/     \/            \/ ");
	Console.ResetColor();
}

CareManagementContext GetCareManagementContext()
{
	return new("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BEDM_CareManagement;Persist Security Info=True");
}

ResidentManagementContext GetResidentManagementContext()
{
	return new("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BEDM_ResidentManagement;Persist Security Info=True");
}

async Task SendMessageAsync(ResidentCareTypeChange message)
{
	string eventHubsConnectionString = Environment.GetEnvironmentVariable("SendAndRecieveEvents_EventHubConnectionString");
	string eventHubName = "care-management";
	await using (var producerClient = new EventHubProducerClient(eventHubsConnectionString, eventHubName))
	{
		// Create a batch of events
		using EventDataBatch eventDataBatch = await producerClient.CreateBatchAsync();

		if (!eventDataBatch.TryAdd(new EventData(Encoding.UTF8.GetBytes(JsonSerializer.Serialize(message)))))
			// if it is too large for the batch
			throw new Exception($"Event is too large for the batch and cannot be sent.");

		try
		{
			// Use the producer client to send the batch of events to the event hub
			await producerClient.SendAsync(eventDataBatch);
			Console.WriteLine($"The event has been published.");
		}
		finally
		{
			await producerClient.CloseAsync();
		}

	}
}
// Depends on Azure.Messaging.EventHubs

// Settings
string eventHubsConnectionString = Environment.GetEnvironmentVariable("SendAndRecieveEvents_EventHubConnectionString");
const string eventHubName = "sendandreceive";

// Client Input
int numberOfEvents = 10;

// Create a producer client that you can use to send events to an event hub
await using (var producerClient = new EventHubProducerClient(eventHubsConnectionString, eventHubName))
{
	// Create a batch of events
	using EventDataBatch eventDataBatch = await producerClient.CreateBatchAsync();

	for (int i = 1; i <= numberOfEvents; i++)
		if (!eventDataBatch.TryAdd(new EventData(Encoding.UTF8.GetBytes($"Event {i}"))))
			// if it is too large for the batch
			throw new Exception($"Event {i} is too large for the batch and cannot be sent.");

	try
	{
		// Use the producer client to send the batch of events to the event hub
		await producerClient.SendAsync(eventDataBatch);
		Console.WriteLine($"A batch of {numberOfEvents} events has been published.");
	}
	finally
	{
		await producerClient.CloseAsync();
	}

}
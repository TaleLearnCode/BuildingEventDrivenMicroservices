namespace SLS.PM.EventServices;

public static class ChangeResidentCareType
{

	public static async Task Process(
		PortfolioManagementContext portfolioManagementContext,
		string eventMessage)
	{
		ResidentCareTypeChange? residentCareTypeChange = JsonSerializer.Deserialize<ResidentCareTypeChange>(eventMessage);
		if (residentCareTypeChange is not null)
		{
			RoomCareType? roomCareType = await portfolioManagementContext.RoomCareTypes
				.FirstOrDefaultAsync(x => x.RoomId == residentCareTypeChange.RoomId);
			if (roomCareType is not null)
			{
				roomCareType.CareTypeId = residentCareTypeChange.CareTypeId;
				portfolioManagementContext.Update(roomCareType);
				await portfolioManagementContext.SaveChangesAsync();
			}
		}
	}

}
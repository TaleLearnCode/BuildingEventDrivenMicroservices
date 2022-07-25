using Microsoft.EntityFrameworkCore;
using SLS.EventMessages.CM;
using SLS.RM.Repository;
using SLS.RM.Repository.Entities;
using System.Text.Json;

namespace SLS.RM.EventServices;

public static class ChangeResidentCareType
{

	public static async Task Process(
		ResidentManagementContext residentManagementContext,
		string eventMessage)
	{
		ResidentCareTypeChange? residentCareTypeChange = JsonSerializer.Deserialize<ResidentCareTypeChange>(eventMessage);
		if (residentCareTypeChange is not null)
		{
			Resident? resident = await residentManagementContext.Residents
				.FirstOrDefaultAsync(x => x.ResidentId == residentCareTypeChange.ResidentId);
			if (resident is not null)
			{
				resident.CareTypeId = residentCareTypeChange.CareTypeId;
				residentManagementContext.Update(resident);
				await residentManagementContext.SaveChangesAsync();
			}
		}
	}

}
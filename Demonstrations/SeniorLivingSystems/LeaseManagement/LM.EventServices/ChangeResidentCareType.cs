namespace SLS.LM.EventServices;

public static class ChangeResidentCareType
{

	public static async Task Process(
		LeaseManagementContext leaseManagementContext,
		string eventMessage)
	{
		ResidentCareTypeChange? residentCareTypeChange = JsonSerializer.Deserialize<ResidentCareTypeChange>(eventMessage);
		if (residentCareTypeChange is not null)
		{
			Leasee? leasee = await leaseManagementContext.Leasees
				.Include(x => x.Leases)
				.FirstOrDefaultAsync(x => x.LeaseeId == residentCareTypeChange.ResidentId);
			if (leasee is not null)
			{
				leasee.CareTypeId = residentCareTypeChange.CareTypeId;
				if (leasee.Leases is not null && leasee.Leases.Any())
					foreach (Lease lease in leasee.Leases)
						lease.PrimaryCost = residentCareTypeChange.RoomRate;
				leaseManagementContext.Update(leasee);
				await leaseManagementContext.SaveChangesAsync();
			}
		}

	}

}
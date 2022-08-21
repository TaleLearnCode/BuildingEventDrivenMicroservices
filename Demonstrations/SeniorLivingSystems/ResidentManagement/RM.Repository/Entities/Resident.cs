namespace SLS.RM.Repository.Entities;

public partial class Resident
{

	public Resident()
	{
		ResidentRooms = new HashSet<ResidentRoom>();
	}

	public int ResidentId { get; set; }
	public string ExternalId { get; set; } = null!;
	public int CommunityId { get; set; }
	public string FirstName { get; set; } = null!;
	public string? MiddleName { get; set; }
	public string LastName { get; set; } = null!;
	public DateTime Birthdate { get; set; }
	public int CareTypeId { get; set; }
	public int ResidentStatusId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Community Community { get; set; } = null!;
	public virtual ResidentStatus ResidentStatus { get; set; } = null!;
	public virtual ICollection<ResidentRoom> ResidentRooms { get; set; }

}
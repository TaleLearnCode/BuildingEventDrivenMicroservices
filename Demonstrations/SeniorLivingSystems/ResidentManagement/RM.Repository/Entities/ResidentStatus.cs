namespace SLS.RM.Repository.Entities;

public partial class ResidentStatus
{

	public ResidentStatus()
	{
		Residents = new HashSet<Resident>();
	}

	public int ResidentStatusId { get; set; }
	public string? ExternalId { get; set; }
	public string ResidentStatusName { get; set; } = null!;
	public int SortOrder { get; set; }
	public int RowStatusId { get; set; }

	public virtual ICollection<Resident> Residents { get; set; }

}
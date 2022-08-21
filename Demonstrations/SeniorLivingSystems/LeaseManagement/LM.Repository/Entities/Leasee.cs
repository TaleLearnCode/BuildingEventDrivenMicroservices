namespace SLS.LM.Repository.Entities;

public partial class Leasee
{

	public Leasee()
	{
		Leases = new HashSet<Lease>();
	}

	public int LeaseeId { get; set; }
	public int CommunityId { get; set; }
	public int CareTypeId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Community Community { get; set; } = null!;
	public virtual ICollection<Lease> Leases { get; set; }

}
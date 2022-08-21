namespace SLS.LM.Repository.Entities;

public partial class Lease
{

	public int LeaseId { get; set; }
	public int LeaseeId { get; set; }
	public int CommunityId { get; set; }
	public DateTime EffectiveDate { get; set; }
	public decimal PrimaryCost { get; set; }

	public virtual Community Community { get; set; } = null!;
	public virtual Leasee Leasee { get; set; } = null!;

}
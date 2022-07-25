namespace SLS.CM.Repository.Entities;

public partial class Caree
{

	public int CareeId { get; set; }
	public string FirstName { get; set; } = null!;
	public string? MiddleName { get; set; }
	public string LastName { get; set; } = null!;
	public int CommunityId { get; set; }
	public int CareTypeId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Community Community { get; set; } = null!;

}
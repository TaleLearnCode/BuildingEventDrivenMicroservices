namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the care types provided by a community.
/// </summary>
public partial class CommunityCareType
{

	/// <summary>
	/// Identifier for the community/care type association.
	/// </summary>
	public int CommunityCareTypeId { get; set; }
	/// <summary>
	/// Identifier for the associated community.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// Identifier for the associated care type.
	/// </summary>
	public int CareTypeId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Community Community { get; set; } = null!;

}
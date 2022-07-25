namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the different statuses for a community.
/// </summary>
public partial class CommunityStatus
{

	public CommunityStatus()
	{
		Communities = new HashSet<Community>();
	}

	/// <summary>
	/// The identifier of the community status record.
	/// </summary>
	public int CommunityStatusId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the community status record.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The name of the community status.
	/// </summary>
	public string CommunityStatusName { get; set; } = null!;
	/// <summary>
	/// The sorting order of the COmmunity Status among the other community statuses.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the Community Status record status (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<Community> Communities { get; set; }

}
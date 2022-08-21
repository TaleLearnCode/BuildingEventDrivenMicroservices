namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the type of a community structure (floor, building, etc.).
/// </summary>
public partial class CommunityStructureType
{

	public CommunityStructureType()
	{
		CommunityStructures = new HashSet<CommunityStructure>();
	}

	/// <summary>
	/// Identifier of the community structure type record.
	/// </summary>
	public int CommunityStructureTypeId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the community structure type.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The name of the community structure type.
	/// </summary>
	public string CommunityStructureTypeName { get; set; } = null!;
	/// <summary>
	/// The sorting order of the community structure type among the other community structure types.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the community structure record status (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<CommunityStructure> CommunityStructures { get; set; }

}
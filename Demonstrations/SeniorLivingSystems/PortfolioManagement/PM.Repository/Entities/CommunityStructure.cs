namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents an element of the structure (floor, building, etc.) within a community.
/// </summary>
public partial class CommunityStructure
{

	public CommunityStructure()
	{
		InverseParent = new HashSet<CommunityStructure>();
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// Identifier of the community structure record.
	/// </summary>
	public int CommunityStructureId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the community structure.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Identifier of the community structure&apos;s parent (example the building a floor is in).
	/// </summary>
	public int? ParentId { get; set; }
	/// <summary>
	/// Identifier of the community the element is defining the structure of.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// Identifier of the community structure&apos;s type.
	/// </summary>
	public int CommunityStructureTypeId { get; set; }
	/// <summary>
	/// The name of the community structure.
	/// </summary>
	public string CommunityStructureName { get; set; } = null!;
	/// <summary>
	/// The code for the community structure.
	/// </summary>
	public string? CommunityStructureCode { get; set; }
	/// <summary>
	/// The sorting order of the community structure among the other community structures.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the status of the community attribute type record (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual Community Community { get; set; } = null!;
	public virtual CommunityStructureType CommunityStructureType { get; set; } = null!;
	public virtual CommunityStructure? Parent { get; set; }
	public virtual ICollection<CommunityStructure> InverseParent { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a room style.
/// </summary>
public partial class RoomStyle
{

	public RoomStyle()
	{
		RoomTypes = new HashSet<RoomType>();
	}

	/// <summary>
	/// Identifier of the room style record.
	/// </summary>
	public int RoomStyleId { get; set; }
	/// <summary>
	/// The tenant&apos;s external identifier for the style.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Name of the room style.
	/// </summary>
	public string RoomStyleName { get; set; } = null!;
	/// <summary>
	/// The code assigned to the room style.
	/// </summary>
	public string? RoomStyleCode { get; set; }
	/// <summary>
	/// The sort order of the room style within the full listing of room styles.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the record row status (i.e. enabled, disabled, etc.).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<RoomType> RoomTypes { get; set; }

}
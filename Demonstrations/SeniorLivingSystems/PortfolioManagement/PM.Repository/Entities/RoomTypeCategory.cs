namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a room type category.
/// </summary>
public partial class RoomTypeCategory
{

	public RoomTypeCategory()
	{
		RoomTypes = new HashSet<RoomType>();
	}

	/// <summary>
	/// Identifier of the room type category record.
	/// </summary>
	public int RoomTypeCategoryId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the room type category.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Name of the room type category.
	/// </summary>
	public string RoomTypeCategoryName { get; set; } = null!;
	/// <summary>
	/// The code associated with the room type category.
	/// </summary>
	public string? RoomTypeCategoryCode { get; set; }
	/// <summary>
	/// The sort order of the room type category within the full listing of room type categories.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the status of the room type category record (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<RoomType> RoomTypes { get; set; }

}
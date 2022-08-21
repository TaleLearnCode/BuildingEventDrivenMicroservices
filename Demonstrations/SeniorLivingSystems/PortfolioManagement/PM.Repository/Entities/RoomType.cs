namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a room type.
/// </summary>
public partial class RoomType
{

	public RoomType()
	{
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// Identifier of the room type record.
	/// </summary>
	public int RoomTypeId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the room type.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Identifier of the associated room style.
	/// </summary>
	public int RoomStyleId { get; set; }
	/// <summary>
	/// Identifier of the category of room type.
	/// </summary>
	public int? RoomTypeCategoryId { get; set; }
	/// <summary>
	/// Name of the room type.
	/// </summary>
	public string RoomTypeName { get; set; } = null!;
	/// <summary>
	/// A short code for the room type.
	/// </summary>
	public string? RoomTypeCode { get; set; }
	/// <summary>
	/// The sorting order of the room type among the other room types.
	/// </summary>
	public int SortOrder { get; set; }
	/// <summary>
	/// Identifier of the room type record status (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual RoomStyle RoomStyle { get; set; } = null!;
	public virtual RoomTypeCategory? RoomTypeCategory { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
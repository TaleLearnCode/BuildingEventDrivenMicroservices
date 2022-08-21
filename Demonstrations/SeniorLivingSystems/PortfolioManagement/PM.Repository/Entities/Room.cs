namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a room within a community.
/// </summary>
public partial class Room
{

	public Room()
	{
		RoomCareTypes = new HashSet<RoomCareType>();
		RoomRates = new HashSet<RoomRate>();
	}

	/// <summary>
	/// Identifier of the room record.
	/// </summary>
	public int RoomId { get; set; }
	/// <summary>
	/// Identifier of the associated community record.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// Identifier for the room from an external system.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Identifier of the associated community structure element (floor, building, etc.).
	/// </summary>
	public int CommunityStructureId { get; set; }
	/// <summary>
	/// The number of the room.
	/// </summary>
	public string RoomNumber { get; set; } = null!;
	/// <summary>
	/// The name of the room.
	/// </summary>
	public string? RoomName { get; set; }
	/// <summary>
	/// Flag indicating whether the room is considered as featured.
	/// </summary>
	public bool IsFeatured { get; set; }
	/// <summary>
	/// Identifier of the associated room availability record.
	/// </summary>
	public int RoomAvailabilityId { get; set; }
	/// <summary>
	/// Identifier of the associated room type record.
	/// </summary>
	public int RoomTypeId { get; set; }
	/// <summary>
	/// Identifier of the associated content record.
	/// </summary>
	public int? ContentId { get; set; }
	/// <summary>
	/// The size of the room. The measurement type is based off of Community.RoomMeasurement.
	/// </summary>
	public decimal? RoomArea { get; set; }
	/// <summary>
	/// Identifier of the digital asset representing the floor plan for the room when it differs from the room type&apos;s floor plan.
	/// </summary>
	public int? FloorPlanId { get; set; }
	public int? AssignedCareTypeId { get; set; }
	/// <summary>
	/// The sorting order of the room among the other rooms.
	/// </summary>
	public int? SortOrder { get; set; }
	public int RowStatusId { get; set; }

	public virtual CareType? AssignedCareType { get; set; }
	public virtual Community Community { get; set; } = null!;
	public virtual CommunityStructure CommunityStructure { get; set; } = null!;
	public virtual Content? Content { get; set; }
	public virtual DigitalAsset? FloorPlan { get; set; }
	public virtual RoomAvailability RoomAvailability { get; set; } = null!;
	public virtual RoomType RoomType { get; set; } = null!;
	public virtual ICollection<RoomCareType> RoomCareTypes { get; set; }
	public virtual ICollection<RoomRate> RoomRates { get; set; }

}
namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the communities managed by the tenant provider.
/// </summary>
public partial class RoomAvailability
{

	public RoomAvailability()
	{
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// Identifier of the room availability record.
	/// </summary>
	public int RoomAvailabilityId { get; set; }
	/// <summary>
	/// The name of the room availability type.
	/// </summary>
	public string RoomAvailabilityName { get; set; } = null!;
	/// <summary>
	/// The external (customer) identifier assigned to the room availability.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The sort order of the room availability type within the full listing of room availability types.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Flag indicating whether the room availability type is shown as available.
	/// </summary>
	public bool ShowAsAvailable { get; set; }
	/// <summary>
	/// Flag indicating whether the room availability type is shown as reserved.
	/// </summary>
	public bool ShowAsReserved { get; set; }
	public int RowStatusId { get; set; }

	public virtual ICollection<Room> Rooms { get; set; }

}
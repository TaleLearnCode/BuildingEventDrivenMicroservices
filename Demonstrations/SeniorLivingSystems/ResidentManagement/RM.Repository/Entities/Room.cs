namespace SLS.RM.Repository.Entities;

/// <summary>
/// Represents a room within a community.
/// </summary>
public partial class Room
{

	public Room()
	{
		ResidentRooms = new HashSet<ResidentRoom>();
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
	/// The number of the room.
	/// </summary>
	public string RoomNumber { get; set; } = null!;
	/// <summary>
	/// The name of the room.
	/// </summary>
	public string? RoomName { get; set; }
	public int? AssignedCareTypeId { get; set; }
	/// <summary>
	/// The sorting order of the room among the other rooms.
	/// </summary>
	public int? SortOrder { get; set; }
	public int RowStatusId { get; set; }

	public virtual CareType? AssignedCareType { get; set; }
	public virtual Community Community { get; set; } = null!;
	public virtual ICollection<ResidentRoom> ResidentRooms { get; set; }

}
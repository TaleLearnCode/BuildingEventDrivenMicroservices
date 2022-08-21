namespace SLS.PM.Repository.Entities;

/// <summary>
/// Defines the care types assigned to a particular room.
/// </summary>
public partial class RoomCareType
{

	/// <summary>
	/// Identifier for the room/care type association record.
	/// </summary>
	public int RoomCareTypeId { get; set; }
	/// <summary>
	/// Identifier for the associated room record.
	/// </summary>
	public int RoomId { get; set; }
	/// <summary>
	/// Identifier for the associated care type record.
	/// </summary>
	public int CareTypeId { get; set; }
	/// <summary>
	/// The operator&apos;s identifier for the room/care type association.
	/// </summary>
	public string? ExternalId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Room Room { get; set; } = null!;

}
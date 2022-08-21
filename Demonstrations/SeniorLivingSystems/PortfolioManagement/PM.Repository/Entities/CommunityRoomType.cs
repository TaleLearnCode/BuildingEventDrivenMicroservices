namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the relationship between the RoomType and Community tables.
/// </summary>
public partial class CommunityRoomType
{

	/// <summary>
	/// Identifier of the community room type record.
	/// </summary>
	public int CommunityRoomTypeId { get; set; }
	/// <summary>
	/// Identifier of the associated Community record.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// Identifier of the associated RoomType record.
	/// </summary>
	public int RoomTypeId { get; set; }
	/// <summary>
	/// Identifier of the associated CareType record.
	/// </summary>
	public int CareTypeId { get; set; }
	/// <summary>
	/// Identifier of the digital asset representing the floor plan for the room type within the community.
	/// </summary>
	public int? FloorPlanId { get; set; }

	public virtual CareType CareType { get; set; } = null!;
	public virtual Community Community { get; set; } = null!;
	public virtual DigitalAsset? FloorPlan { get; set; }

}

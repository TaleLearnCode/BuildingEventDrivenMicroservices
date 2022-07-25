namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the rate information for a room for a specific set of dates..
/// </summary>
public partial class RoomRate
{

	/// <summary>
	/// Identifier of the room rate.
	/// </summary>
	public int RoomRateId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the room rate.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Identifier of the associated room.
	/// </summary>
	public int RoomId { get; set; }
	/// <summary>
	/// Identifier of the associated payor type.
	/// </summary>
	public int PayorTypeId { get; set; }
	/// <summary>
	/// The date and time the rate information is effective.
	/// </summary>
	public DateTime EffectiveStartDate { get; set; }
	/// <summary>
	/// The date and time the rate information is no longer effective.
	/// </summary>
	public DateTime EffectiveEndDate { get; set; }
	/// <summary>
	/// The base (MSRP) rate for the room, room rate type, and payor type.
	/// </summary>
	public decimal BaseRate { get; set; }
	/// <summary>
	/// The daily rate for the room.
	/// </summary>
	public decimal? DailyRate { get; set; }
	/// <summary>
	/// The minimum amount accepted for the room.
	/// </summary>
	public decimal MinimumRate { get; set; }
	/// <summary>
	/// The maximum amount accepted for the room.
	/// </summary>
	public decimal MaximumRate { get; set; }
	/// <summary>
	/// The discounted rate (starting at) for the room.
	/// </summary>
	public decimal? DiscountedRate { get; set; }
	/// <summary>
	/// The standard administrative fee applied to the room.
	/// </summary>
	public decimal? AdministrativeFee { get; set; }
	/// <summary>
	/// The max concession allowed for the room.
	/// </summary>
	public decimal? MaxConcession { get; set; }
	public int RowStatusId { get; set; }

	public virtual PayorType PayorType { get; set; } = null!;
	public virtual Room Room { get; set; } = null!;

}
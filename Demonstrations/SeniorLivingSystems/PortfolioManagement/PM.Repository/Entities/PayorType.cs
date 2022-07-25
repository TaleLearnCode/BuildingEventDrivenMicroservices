namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a type of payor.
/// </summary>
public partial class PayorType
{

	public PayorType()
	{
		RoomRates = new HashSet<RoomRate>();
	}

	/// <summary>
	/// Identifier of the payor type.
	/// </summary>
	public int PayorTypeId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the payor type.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The name of the payor type.
	/// </summary>
	public string PayorTypeName { get; set; } = null!;
	public bool IsDefault { get; set; }
	/// <summary>
	/// The sort order of the payor type within the full listing of payor types.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the status for the row (i.e. enabled, disabled, etc.).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<RoomRate> RoomRates { get; set; }

}
namespace SLS.LM.Repository.Entities;

/// <summary>
/// Represents a type of care provided by a community.
/// </summary>
public partial class CareType
{

	public CareType()
	{
		Leasees = new HashSet<Leasee>();
	}

	/// <summary>
	/// Identifier for the care type record.
	/// </summary>
	public int CareTypeId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the care type.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The name of the care type.
	/// </summary>
	public string CareTypeName { get; set; } = null!;
	/// <summary>
	/// The code assigned to the care type.
	/// </summary>
	public string? CareTypeCode { get; set; }
	/// <summary>
	/// The foreground color to use when displaying the care type within the Glennis suite of products.
	/// </summary>
	public string? ForegroundColor { get; set; }
	/// <summary>
	/// The background color to use when displaying the care type within the Glennis suite of products.
	/// </summary>
	public string? BackgroundColor { get; set; }

	public virtual ICollection<Leasee> Leasees { get; set; }

}
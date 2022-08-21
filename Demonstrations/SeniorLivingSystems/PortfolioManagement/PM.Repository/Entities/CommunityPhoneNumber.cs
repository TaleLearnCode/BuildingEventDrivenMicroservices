namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the linking of a community to an phone number.
/// </summary>
public partial class CommunityPhoneNumber
{

	public int CommunityPhoneNumberId { get; set; }

	/// <summary>
	/// The identifier of the associated community record.
	/// </summary>
	public int CommunityId { get; set; }
	public int PhoneNumberTypeId { get; set; }
	public string? ExternalId { get; set; }
	public string? CountryCode { get; set; }
	public string PhoneNumber { get; set; } = null!;
	public bool IsListingNumber { get; set; }

	public virtual Community Community { get; set; } = null!;
	public virtual PhoneNumberType PhoneNumberType { get; set; } = null!;

}
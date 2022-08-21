namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents the linking of a community to an address.
/// </summary>
public partial class CommunityPostalAddress
{

	public int CommunityPostalAddressId { get; set; }
	public int CommunityId { get; set; }
	public string? ExternalId { get; set; }
	public string? StreetAddress1 { get; set; }
	public string? StreetAddress2 { get; set; }
	public string City { get; set; } = null!;
	public string? CountryDivisionCode { get; set; }
	public string CountryCode { get; set; } = null!;
	public string? PostalCode { get; set; }
	public int? PostalAddressTypeId { get; set; }
	/// <summary>
	/// Flag indicating whether the associated language is the default listing address for the community.
	/// </summary>
	public bool IsListingAddress { get; set; }

	public virtual Community Community { get; set; } = null!;
	public virtual CountryDivision? Country { get; set; }
	public virtual Country CountryCodeNavigation { get; set; } = null!;
	public virtual PostalAddressType? PostalAddressType { get; set; }

}
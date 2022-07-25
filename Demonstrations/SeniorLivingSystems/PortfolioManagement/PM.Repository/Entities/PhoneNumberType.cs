namespace SLS.PM.Repository.Entities;

/// <summary>
/// Lookup values representing phone number types used by Glennis.
/// </summary>
public partial class PhoneNumberType
{

	public PhoneNumberType()
	{
		CommunityPhoneNumbers = new HashSet<CommunityPhoneNumber>();
	}

	/// <summary>
	/// Identifier of the phone number type.
	/// </summary>
	public int PhoneNumberTypeId { get; set; }
	/// <summary>
	/// The operator identifier for the phone number type.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Name of the phone number type.
	/// </summary>
	public string PhoneNumberTypeName { get; set; } = null!;
	/// <summary>
	/// The sorting order of the phone number type.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Flag indicating whether the phone number type is the default phone number type.
	/// </summary>
	public bool IsDefault { get; set; }
	/// <summary>
	/// Identifier of the status for the row (i.e. enabled, disabled, etc.).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual ICollection<CommunityPhoneNumber> CommunityPhoneNumbers { get; set; }

}
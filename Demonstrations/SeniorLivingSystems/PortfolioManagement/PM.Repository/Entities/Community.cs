namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a community run by the tenant.
/// </summary>
public partial class Community
{

	public Community()
	{
		CommunityCareTypes = new HashSet<CommunityCareType>();
		CommunityPhoneNumbers = new HashSet<CommunityPhoneNumber>();
		CommunityPostalAddresses = new HashSet<CommunityPostalAddress>();
		CommunityRoomTypes = new HashSet<CommunityRoomType>();
		CommunityStructures = new HashSet<CommunityStructure>();
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// The identifier of the community record.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// The tenant&apos;s number (identifier) for the community.
	/// </summary>
	public string CommunityNumber { get; set; } = null!;
	/// <summary>
	/// The name of the community.
	/// </summary>
	public string CommunityName { get; set; } = null!;
	/// <summary>
	/// The name of the community used externally.
	/// </summary>
	public string? ExternalName { get; set; }
	/// <summary>
	/// The default language culture to be used for the community.
	/// </summary>
	public string LanguageCultureCode { get; set; } = null!;
	/// <summary>
	/// The measurement type used for room area (i.e. square feet, square meters, etc.)
	/// </summary>
	public string RoomMeasurement { get; set; } = null!;
	public int? OverviewId { get; set; }
	/// <summary>
	/// Identifier of the country the community is located in.
	/// </summary>
	public string? CountryCode { get; set; }
	/// <summary>
	/// The longitude where the community is located.
	/// </summary>
	public string? Longitude { get; set; }
	/// <summary>
	/// The latitude where the community is located.
	/// </summary>
	public string? Latitude { get; set; }
	/// <summary>
	/// Identifier of the digital asset that serves as the profile image for the community.
	/// </summary>
	public int? ProfileImageId { get; set; }
	public int CommunityStatusId { get; set; }
	/// <summary>
	/// Flag indicating whether the community is featured.
	/// </summary>
	public bool IsFeatured { get; set; }
	/// <summary>
	/// Identifier of the community record status (i.e. enabled, disabled, etc).
	/// </summary>
	public int RowStatusId { get; set; }

	public virtual CommunityStatus CommunityStatus { get; set; } = null!;
	public virtual Country? CountryCodeNavigation { get; set; }
	public virtual LanguageCulture LanguageCultureCodeNavigation { get; set; } = null!;
	public virtual Content? Overview { get; set; }
	public virtual DigitalAsset? ProfileImage { get; set; }
	public virtual ICollection<CommunityCareType> CommunityCareTypes { get; set; }
	public virtual ICollection<CommunityPhoneNumber> CommunityPhoneNumbers { get; set; }
	public virtual ICollection<CommunityPostalAddress> CommunityPostalAddresses { get; set; }
	public virtual ICollection<CommunityRoomType> CommunityRoomTypes { get; set; }
	public virtual ICollection<CommunityStructure> CommunityStructures { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
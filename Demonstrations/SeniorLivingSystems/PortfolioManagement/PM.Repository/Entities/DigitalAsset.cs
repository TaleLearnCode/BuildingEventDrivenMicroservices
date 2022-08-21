namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a digital asset maintained by the Digital Content Management System.
/// </summary>
public partial class DigitalAsset
{

	public DigitalAsset()
	{
		Communities = new HashSet<Community>();
		CommunityRoomTypes = new HashSet<CommunityRoomType>();
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// Identifier of the DigitalAsset record.
	/// </summary>
	public int DigitalAssetId { get; set; }
	/// <summary>
	/// The tenant&apos;s identifier for the Digital Asset.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// Characteristic to distinguish digital assets within a group.
	/// </summary>
	public string? Discriminator { get; set; }
	/// <summary>
	/// Identifier of the associated Digital Asset Type.
	/// </summary>
	public int DigitalAssetTypeId { get; set; }
	/// <summary>
	/// The URL to the digital asset.
	/// </summary>
	public string? DigitalAssetUrl { get; set; }
	/// <summary>
	/// The URL to the thumbnail for the digital asset.
	/// </summary>
	public string? ThumbnailUrl { get; set; }
	/// <summary>
	/// The name of the Digital Asset.
	/// </summary>
	public string? DigitalAssetName { get; set; }
	/// <summary>
	/// A description of the Digital Asset.
	/// </summary>
	public string? DigitalAssetDescription { get; set; }
	/// <summary>
	/// Identifier of the Content used as the digital asset&apos;s alternate text.
	/// </summary>
	public int? AltTextId { get; set; }
	/// <summary>
	/// Identifier of the Content used as the digital asset&apos;s caption.
	/// </summary>
	public int? CaptionId { get; set; }
	/// <summary>
	/// Identifier of an associated Content record.
	/// </summary>
	public int? ContentId { get; set; }
	/// <summary>
	/// The date and time the Digital Asset becomes effective.
	/// </summary>
	public DateTime EffectiveStartDate { get; set; }
	/// <summary>
	/// The date and time the Digital Asset is no longer effective.
	/// </summary>
	public DateTime EffectiveEndDate { get; set; }
	/// <summary>
	/// Flag indicating whether the DigitalAsset is active.
	/// </summary>
	public bool? IsActive { get; set; }

	public virtual Content? AltText { get; set; }
	public virtual Content? Caption { get; set; }
	public virtual Content? Content { get; set; }
	public virtual DigitalAssetType DigitalAssetType { get; set; } = null!;
	public virtual ICollection<Community> Communities { get; set; }
	public virtual ICollection<CommunityRoomType> CommunityRoomTypes { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents content for an item managed by the system.
/// </summary>
public partial class Content
{

	public Content()
	{
		Communities = new HashSet<Community>();
		ContentCopies = new HashSet<ContentCopy>();
		DigitalAssetAltTexts = new HashSet<DigitalAsset>();
		DigitalAssetCaptions = new HashSet<DigitalAsset>();
		DigitalAssetContents = new HashSet<DigitalAsset>();
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// Identifier of the Content record.
	/// </summary>
	public int ContentId { get; set; }
	/// <summary>
	/// The Tenant&apos;s identifier for the Content record.
	/// </summary>
	public string? ExternalId { get; set; }
	/// <summary>
	/// The name of the Content.
	/// </summary>
	public string? ContentName { get; set; }

	public virtual ICollection<Community> Communities { get; set; }
	public virtual ICollection<ContentCopy> ContentCopies { get; set; }
	public virtual ICollection<DigitalAsset> DigitalAssetAltTexts { get; set; }
	public virtual ICollection<DigitalAsset> DigitalAssetCaptions { get; set; }
	public virtual ICollection<DigitalAsset> DigitalAssetContents { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
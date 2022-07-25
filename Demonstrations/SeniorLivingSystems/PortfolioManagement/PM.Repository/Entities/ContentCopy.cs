namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents content for an item managed by the system.
/// </summary>
public partial class ContentCopy
{

	/// <summary>
	/// Identifier of the associated Content record.
	/// </summary>
	public int ContentId { get; set; }
	/// <summary>
	/// Identifier of the associated LanguageCulture record.
	/// </summary>
	public string LanguageCultureCode { get; set; } = null!;
	/// <summary>
	/// The text of the content copy.
	/// </summary>
	public string CopyText { get; set; } = null!;

	public virtual Content Content { get; set; } = null!;
	public virtual LanguageCulture LanguageCultureCodeNavigation { get; set; } = null!;

}
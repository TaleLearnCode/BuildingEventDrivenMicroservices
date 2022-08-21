namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a language with culture differences that is spoken/written.
/// </summary>
public partial class LanguageCulture
{

	public LanguageCulture()
	{
		Communities = new HashSet<Community>();
		ContentCopies = new HashSet<ContentCopy>();
	}

	/// <summary>
	/// Identifier of the language culture record.
	/// </summary>
	public string LanguageCultureCode { get; set; } = null!;
	/// <summary>
	/// Code for the associated language.
	/// </summary>
	public string LanguageCode { get; set; } = null!;
	/// <summary>
	/// The English name of the language culture.
	/// </summary>
	public string EnglishName { get; set; } = null!;
	/// <summary>
	/// The native name of the language culture.
	/// </summary>
	public string NativeName { get; set; } = null!;
	/// <summary>
	/// Flag indicating whether the language culture is active.
	/// </summary>
	public bool? IsActive { get; set; }
	/// <summary>
	/// The date and time the language culture record was created.
	/// </summary>
	public DateTime CreatedDate { get; set; }
	/// <summary>
	/// Identifier of the user that created the language culture record.
	/// </summary>
	public string CreatedBy { get; set; } = null!;
	/// <summary>
	/// The date and time the language culture record was created.
	/// </summary>
	public DateTime? ModifiedDate { get; set; }
	/// <summary>
	/// Identifier of the user that created the language culture record.
	/// </summary>
	public string? ModifiedBy { get; set; }

	public virtual ICollection<Community> Communities { get; set; }
	public virtual ICollection<ContentCopy> ContentCopies { get; set; }

}
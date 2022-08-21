namespace SLS.PM.Repository.Entities;

/// <summary>
/// Represents a spoken/written language.
/// </summary>
public partial class Language
{

	/// <summary>
	/// Identifier of the language.
	/// </summary>
	public string LanguageCode { get; set; } = null!;
	/// <summary>
	/// Name of the language.
	/// </summary>
	public string LanguageName { get; set; } = null!;
	/// <summary>
	/// Native name of the language.
	/// </summary>
	public string NativeName { get; set; } = null!;
	/// <summary>
	/// Flag indicating whether the language is active.
	/// </summary>
	public bool IsActive { get; set; }

}
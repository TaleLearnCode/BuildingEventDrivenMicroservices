namespace SLS.RM.Repository.Entities;

/// <summary>
/// Represents a type of payor.
/// </summary>
public partial class PayorType
{

	/// <summary>
	/// Identifier of the payor type.
	/// </summary>
	public int PayorTypeId { get; set; }
	/// <summary>
	/// The name of the payor type.
	/// </summary>
	public string PayorTypeName { get; set; } = null!;
	public bool IsDefault { get; set; }
	/// <summary>
	/// The sort order of the payor type within the full listing of payor types.
	/// </summary>
	public int? SortOrder { get; set; }
	/// <summary>
	/// Identifier of the status for the row (i.e. enabled, disabled, etc.).
	/// </summary>
	public int RowStatusId { get; set; }

}
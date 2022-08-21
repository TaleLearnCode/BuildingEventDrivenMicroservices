namespace SLS.PM.Repository.Entities;

/// <summary>
/// Lookup table representing the world regions as defined by the UN M49 specification.
/// </summary>
public partial class WorldRegion
{

	public WorldRegion()
	{
		CountryWorldRegionCodeNavigations = new HashSet<Country>();
		CountryWorldSubregionCodeNavigations = new HashSet<Country>();
		InverseParent = new HashSet<WorldRegion>();
	}

	/// <summary>
	/// Identifier of the world region.
	/// </summary>
	public string WorldRegionCode { get; set; } = null!;
	/// <summary>
	/// Name of the world region.
	/// </summary>
	public string WorldRegionName { get; set; } = null!;
	/// <summary>
	/// Identifier of the world region parent (for subregions).
	/// </summary>
	public string? ParentId { get; set; }
	/// <summary>
	/// Flag indicating whether the world region is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual WorldRegion? Parent { get; set; }
	public virtual ICollection<Country> CountryWorldRegionCodeNavigations { get; set; }
	public virtual ICollection<Country> CountryWorldSubregionCodeNavigations { get; set; }
	public virtual ICollection<WorldRegion> InverseParent { get; set; }

}
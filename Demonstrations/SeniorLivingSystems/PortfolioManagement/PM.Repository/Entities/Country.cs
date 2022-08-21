namespace SLS.PM.Repository.Entities;

/// <summary>
/// Lookup table representing the countries as defined by the ISO 3166-1 standard.
/// </summary>
public partial class Country
{

	public Country()
	{
		Communities = new HashSet<Community>();
		CommunityPostalAddresses = new HashSet<CommunityPostalAddress>();
		CountryDivisions = new HashSet<CountryDivision>();
	}

	/// <summary>
	/// Identifier of the country as defined by ISO 3166-1.
	/// </summary>
	public string CountryCode { get; set; } = null!;
	/// <summary>
	/// Name of the country using the ISO 3166-1 Country Name.
	/// </summary>
	public string CountryName { get; set; } = null!;
	/// <summary>
	/// Identifier of the world region where the country is located.
	/// </summary>
	public string WorldRegionCode { get; set; } = null!;
	/// <summary>
	/// Identifier of the world subregion where the country is located.
	/// </summary>
	public string? WorldSubregionCode { get; set; }
	/// <summary>
	/// Flag indicating whether the country has divisions (states, provinces, etc.).
	/// </summary>
	public bool HasDivisions { get; set; }
	/// <summary>
	/// The primary name of the country&apos;s divisions.
	/// </summary>
	public string? DivisionName { get; set; }
	/// <summary>
	/// Flag indicating whether the country record is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual WorldRegion WorldRegionCodeNavigation { get; set; } = null!;
	public virtual WorldRegion? WorldSubregionCodeNavigation { get; set; }
	public virtual ICollection<Community> Communities { get; set; }
	public virtual ICollection<CommunityPostalAddress> CommunityPostalAddresses { get; set; }
	public virtual ICollection<CountryDivision> CountryDivisions { get; set; }

}
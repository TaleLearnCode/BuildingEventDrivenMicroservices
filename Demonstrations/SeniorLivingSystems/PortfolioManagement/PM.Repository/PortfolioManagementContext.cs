namespace SLS.PM.Repository;

public class PortfolioManagementContext : DbContext
{

	private readonly string? _connectionString;

	public PortfolioManagementContext(string connectionString)
	{
		_connectionString = connectionString;
	}

	public PortfolioManagementContext(DbContextOptions<PortfolioManagementContext> options) : base(options) { }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		if (!optionsBuilder.IsConfigured && !string.IsNullOrWhiteSpace(_connectionString))
			optionsBuilder.UseSqlServer(_connectionString);
	}

	public virtual DbSet<CareType> CareTypes { get; set; } = null!;
	public virtual DbSet<Community> Communities { get; set; } = null!;
	public virtual DbSet<CommunityCareType> CommunityCareTypes { get; set; } = null!;
	public virtual DbSet<CommunityPhoneNumber> CommunityPhoneNumbers { get; set; } = null!;
	public virtual DbSet<CommunityPostalAddress> CommunityPostalAddresses { get; set; } = null!;
	public virtual DbSet<CommunityRoomType> CommunityRoomTypes { get; set; } = null!;
	public virtual DbSet<CommunityStatus> CommunityStatuses { get; set; } = null!;
	public virtual DbSet<CommunityStructure> CommunityStructures { get; set; } = null!;
	public virtual DbSet<CommunityStructureType> CommunityStructureTypes { get; set; } = null!;
	public virtual DbSet<Content> Contents { get; set; } = null!;
	public virtual DbSet<ContentCopy> ContentCopies { get; set; } = null!;
	public virtual DbSet<Country> Countries { get; set; } = null!;
	public virtual DbSet<CountryDivision> CountryDivisions { get; set; } = null!;
	public virtual DbSet<DigitalAsset> DigitalAssets { get; set; } = null!;
	public virtual DbSet<DigitalAssetType> DigitalAssetTypes { get; set; } = null!;
	public virtual DbSet<Language> Languages { get; set; } = null!;
	public virtual DbSet<LanguageCulture> LanguageCultures { get; set; } = null!;
	public virtual DbSet<PayorType> PayorTypes { get; set; } = null!;
	public virtual DbSet<PhoneNumberType> PhoneNumberTypes { get; set; } = null!;
	public virtual DbSet<PostalAddressType> PostalAddressTypes { get; set; } = null!;
	public virtual DbSet<Room> Rooms { get; set; } = null!;
	public virtual DbSet<RoomAvailability> RoomAvailabilities { get; set; } = null!;
	public virtual DbSet<RoomCareType> RoomCareTypes { get; set; } = null!;
	public virtual DbSet<RoomRate> RoomRates { get; set; } = null!;
	public virtual DbSet<RoomStyle> RoomStyles { get; set; } = null!;
	public virtual DbSet<RoomType> RoomTypes { get; set; } = null!;
	public virtual DbSet<RoomTypeCategory> RoomTypeCategories { get; set; } = null!;
	public virtual DbSet<WorldRegion> WorldRegions { get; set; } = null!;

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		CreateModel.CareType(modelBuilder);
		CreateModel.Community(modelBuilder);
		CreateModel.CommunityCareType(modelBuilder);
		CreateModel.CommunityPhoneNumber(modelBuilder);
		CreateModel.CommunityPostalAddress(modelBuilder);
		CreateModel.CommunityRoomType(modelBuilder);
		CreateModel.CommunityStatus(modelBuilder);
		CreateModel.CommunityStructure(modelBuilder);
		CreateModel.CommunityStructureType(modelBuilder);
		CreateModel.Content(modelBuilder);
		CreateModel.ContentCopy(modelBuilder);
		CreateModel.Country(modelBuilder);
		CreateModel.CountryDivision(modelBuilder);
		CreateModel.DigitalAsset(modelBuilder);
		CreateModel.DigitalAssetType(modelBuilder);
		CreateModel.Language(modelBuilder);
		CreateModel.LanguageCulture(modelBuilder);
		CreateModel.PayorType(modelBuilder);
		CreateModel.PhoneNumberType(modelBuilder);
		CreateModel.PostalAddressType(modelBuilder);
		CreateModel.Room(modelBuilder);
		CreateModel.RoomAvailability(modelBuilder);
		CreateModel.RoomCareType(modelBuilder);
		CreateModel.RoomRate(modelBuilder);
		CreateModel.RoomStyle(modelBuilder);
		CreateModel.RoomType(modelBuilder);
		CreateModel.RoomTypeCategory(modelBuilder);
		CreateModel.WorldRegion(modelBuilder);

	}


}
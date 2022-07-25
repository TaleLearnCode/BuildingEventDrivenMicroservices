namespace SLS.CM.Repository;

public partial class CareManagementContext : DbContext
{

	private readonly string? _connectionString;

	public CareManagementContext(string connectionString)
	{
		_connectionString = connectionString;
	}

	public CareManagementContext(DbContextOptions<CareManagementContext> options) : base(options) { }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		if (!optionsBuilder.IsConfigured && !string.IsNullOrWhiteSpace(_connectionString))
			optionsBuilder.UseSqlServer(_connectionString);
	}


	public virtual DbSet<CareType> CareTypes { get; set; } = null!;
	public virtual DbSet<Caree> Carees { get; set; } = null!;
	public virtual DbSet<Community> Communities { get; set; } = null!;


	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		CreateModel.CareType(modelBuilder);
		CreateModel.Caree(modelBuilder);
		CreateModel.Community(modelBuilder);
	}

}
namespace SLS.LM.Repository;

public partial class LeaseManagementContext : DbContext
{

	private readonly string? _connectionString;

	public LeaseManagementContext(string connectionString)
	{
		_connectionString = connectionString;
	}

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		if (!optionsBuilder.IsConfigured && !string.IsNullOrWhiteSpace(_connectionString))
			optionsBuilder.UseSqlServer(_connectionString);
	}


	public LeaseManagementContext(DbContextOptions<LeaseManagementContext> options) : base(options) { }

	public virtual DbSet<CareType> CareTypes { get; set; } = null!;
	public virtual DbSet<Community> Communities { get; set; } = null!;
	public virtual DbSet<Lease> Leases { get; set; } = null!;
	public virtual DbSet<Leasee> Leasees { get; set; } = null!;

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		CreateModel.CareType(modelBuilder);
		CreateModel.Community(modelBuilder);
		CreateModel.Lease(modelBuilder);
		CreateModel.Leasee(modelBuilder);
	}


}
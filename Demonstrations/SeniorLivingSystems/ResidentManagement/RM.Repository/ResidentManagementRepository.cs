using Microsoft.EntityFrameworkCore;
using SLS.RM.Repository.Entities;

namespace SLS.RM.Repository;

public class ResidentManagementContext : DbContext
{

	private readonly string? _connectionString;

	public ResidentManagementContext(string connectionString)
	{
		_connectionString = connectionString;
	}

	public ResidentManagementContext(DbContextOptions<ResidentManagementContext> options) : base(options) { }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		if (!optionsBuilder.IsConfigured && !string.IsNullOrWhiteSpace(_connectionString))
			optionsBuilder.UseSqlServer(_connectionString);
	}

	public virtual DbSet<CareType> CareTypes { get; set; } = null!;
	public virtual DbSet<Community> Communities { get; set; } = null!;
	public virtual DbSet<PayorType> PayorTypes { get; set; } = null!;
	public virtual DbSet<Resident> Residents { get; set; } = null!;
	public virtual DbSet<ResidentRoom> ResidentRooms { get; set; } = null!;
	public virtual DbSet<ResidentStatus> ResidentStatuses { get; set; } = null!;
	public virtual DbSet<Room> Rooms { get; set; } = null!;

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		CreateModel.CareType(modelBuilder);
		CreateModel.Community(modelBuilder);
		CreateModel.PayorType(modelBuilder);
		CreateModel.Resident(modelBuilder);
		CreateModel.ResidentRoom(modelBuilder);
		CreateModel.ResidentStatus(modelBuilder);
		CreateModel.Room(modelBuilder);
	}

}
namespace SLS.RM.Repository;

internal static partial class CreateModel
{

	internal static void ResidentStatus(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ResidentStatus>(entity =>
		{
			entity.ToTable("ResidentStatus", "RM");

			entity.Property(e => e.ExternalId).HasMaxLength(100);

			entity.Property(e => e.ResidentStatusName).HasMaxLength(100);

			entity.Property(e => e.RowStatusId).HasDefaultValueSql("((1))");
		});
	}

}
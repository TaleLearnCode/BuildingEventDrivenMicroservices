namespace SLS.LM.Repository;

internal static partial class CreateModel
{

	internal static void Lease(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Lease>(entity =>
		{
			entity.ToTable("Lease", "LM");

			entity.Property(e => e.EffectiveDate).HasColumnType("date");

			entity.Property(e => e.PrimaryCost).HasColumnType("decimal(7, 2)");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.Leases)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkLease_Community");

			entity.HasOne(d => d.Leasee)
					.WithMany(p => p.Leases)
					.HasForeignKey(d => d.LeaseeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkLease_Leasee");
		});
	}

}
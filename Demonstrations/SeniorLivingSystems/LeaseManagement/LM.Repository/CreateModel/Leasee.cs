namespace SLS.LM.Repository;

internal static partial class CreateModel
{

	internal static void Leasee(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Leasee>(entity =>
		{
			entity.ToTable("Leasee", "LM");

			entity.Property(e => e.LeaseeId).ValueGeneratedNever();

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.Leasees)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCaree_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.Leasees)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCaree_Community");
		});
	}

}
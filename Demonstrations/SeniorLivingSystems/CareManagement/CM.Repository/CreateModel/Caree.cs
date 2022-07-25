namespace SLS.CM.Repository;

internal static partial class CreateModel
{

	internal static void Caree(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Caree>(entity =>
		{
			entity.ToTable("Caree", "CM");

			entity.Property(e => e.CareeId).ValueGeneratedNever();

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.Carees)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCaree_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.Carees)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCaree_Community");
		});
	}

}
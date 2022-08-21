namespace SLS.RM.Repository;

internal static partial class CreateModel
{

	internal static void Resident(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Resident>(entity =>
		{
			entity.ToTable("Resident", "RM");

			entity.Property(e => e.Birthdate).HasColumnType("date");

			entity.Property(e => e.ExternalId).HasMaxLength(100);

			entity.Property(e => e.FirstName).HasMaxLength(100);

			entity.Property(e => e.LastName).HasMaxLength(100);

			entity.Property(e => e.MiddleName).HasMaxLength(100);

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.Residents)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkResident_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.Residents)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkResident_Community");

			entity.HasOne(d => d.ResidentStatus)
					.WithMany(p => p.Residents)
					.HasForeignKey(d => d.ResidentStatusId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkResident_ResidentStatus");
		});
	}

}
namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityCareType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityCareType>(entity =>
		{
			entity.ToTable("CommunityCareType", "PM");

			entity.HasComment("Represents the care types provided by a community.");

			entity.Property(e => e.CommunityCareTypeId).HasComment("Identifier for the community/care type association.");

			entity.Property(e => e.CareTypeId).HasComment("Identifier for the associated care type.");

			entity.Property(e => e.CommunityId).HasComment("Identifier for the associated community.");

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.CommunityCareTypes)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityCareType_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.CommunityCareTypes)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityCareType_Community");
		});
	}

}
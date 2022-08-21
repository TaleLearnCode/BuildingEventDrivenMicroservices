namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityRoomType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityRoomType>(entity =>
		{
			entity.ToTable("CommunityRoomType", "PM");

			entity.HasComment("Represents the relationship between the RoomType and Community tables.");

			entity.Property(e => e.CommunityRoomTypeId).HasComment("Identifier of the community room type record.");

			entity.Property(e => e.CareTypeId).HasComment("Identifier of the associated CareType record.");

			entity.Property(e => e.CommunityId).HasComment("Identifier of the associated Community record.");

			entity.Property(e => e.FloorPlanId).HasComment("Identifier of the digital asset representing the floor plan for the room type within the community.");

			entity.Property(e => e.RoomTypeId).HasComment("Identifier of the associated RoomType record.");

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.CommunityRoomTypes)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityRoomType_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.CommunityRoomTypes)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityRoomType_Community");

			entity.HasOne(d => d.FloorPlan)
					.WithMany(p => p.CommunityRoomTypes)
					.HasForeignKey(d => d.FloorPlanId)
					.HasConstraintName("fkCommunityRoomType_DigitalAsset");
		});
	}

}
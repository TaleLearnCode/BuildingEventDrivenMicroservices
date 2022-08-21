namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void Room(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Room>(entity =>
		{
			entity.ToTable("Room", "PM");

			entity.HasComment("Represents a room within a community.")
					.ToTable(tb => tb.IsTemporal(ttb =>
					{
						ttb.UseHistoryTable("RoomHistory", "PM");
						ttb
													.HasPeriodStart("ValidFrom")
													.HasColumnName("ValidFrom");
						ttb
													.HasPeriodEnd("ValidTo")
													.HasColumnName("ValidTo");
					}
					));

			entity.HasIndex(e => e.CommunityId, "idxRoom_CommunityId");

			entity.HasIndex(e => e.ExternalId, "unqRoom_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.RoomId).HasComment("Identifier of the room record.");

			entity.Property(e => e.CommunityId).HasComment("Identifier of the associated community record.");

			entity.Property(e => e.CommunityStructureId).HasComment("Identifier of the associated community structure element (floor, building, etc.).");

			entity.Property(e => e.ContentId).HasComment("Identifier of the associated content record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("Identifier for the room from an external system.");

			entity.Property(e => e.FloorPlanId).HasComment("Identifier of the digital asset representing the floor plan for the room when it differs from the room type's floor plan.");

			entity.Property(e => e.IsFeatured).HasComment("Flag indicating whether the room is considered as featured.");

			entity.Property(e => e.RoomArea)
					.HasColumnType("decimal(7, 2)")
					.HasComment("The size of the room. The measurement type is based off of Community.RoomMeasurement.");

			entity.Property(e => e.RoomAvailabilityId).HasComment("Identifier of the associated room availability record.");

			entity.Property(e => e.RoomName)
					.HasMaxLength(100)
					.HasComment("The name of the room.");

			entity.Property(e => e.RoomNumber)
					.HasMaxLength(100)
					.HasComment("The number of the room.");

			entity.Property(e => e.RoomTypeId).HasComment("Identifier of the associated room type record.");

			entity.Property(e => e.RowStatusId).HasDefaultValueSql("((1))");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the room among the other rooms.");

			entity.HasOne(d => d.AssignedCareType)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.AssignedCareTypeId)
					.HasConstraintName("fkRoom_CareType");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoom_Community");

			entity.HasOne(d => d.CommunityStructure)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.CommunityStructureId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoom_CommunityStructure");

			entity.HasOne(d => d.Content)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.ContentId)
					.HasConstraintName("fkRoom_Content");

			entity.HasOne(d => d.FloorPlan)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.FloorPlanId)
					.HasConstraintName("fkRoom_DigitalAsset");

			entity.HasOne(d => d.RoomAvailability)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.RoomAvailabilityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoom_RoomAvailability");

			entity.HasOne(d => d.RoomType)
					.WithMany(p => p.Rooms)
					.HasForeignKey(d => d.RoomTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoom_RoomType");
		});
	}

}
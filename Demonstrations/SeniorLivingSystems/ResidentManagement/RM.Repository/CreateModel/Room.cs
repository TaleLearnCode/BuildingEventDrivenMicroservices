namespace SLS.RM.Repository;

internal static partial class CreateModel
{

	internal static void Room(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Room>(entity =>
		{
			entity.ToTable("Room", "RM");

			entity.HasComment("Represents a room within a community.")
					.ToTable(tb => tb.IsTemporal(ttb =>
					{
						ttb.UseHistoryTable("RoomHistory", "RM");
						ttb
													.HasPeriodStart("ValidFrom")
													.HasColumnName("ValidFrom");
						ttb
													.HasPeriodEnd("ValidTo")
													.HasColumnName("ValidTo");
					}
));

			entity.Property(e => e.RoomId)
					.ValueGeneratedNever()
					.HasComment("Identifier of the room record.");

			entity.Property(e => e.CommunityId).HasComment("Identifier of the associated community record.");

			entity.Property(e => e.RoomName)
					.HasMaxLength(100)
					.HasComment("The name of the room.");

			entity.Property(e => e.RoomNumber)
					.HasMaxLength(100)
					.HasComment("The number of the room.");

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
		});
	}

}
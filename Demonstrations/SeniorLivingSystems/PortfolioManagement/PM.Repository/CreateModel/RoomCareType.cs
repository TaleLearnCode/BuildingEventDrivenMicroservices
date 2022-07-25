namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomCareType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomCareType>(entity =>
		{
			entity.ToTable("RoomCareType", "PM");

			entity.HasComment("Defines the care types assigned to a particular room.");

			entity.Property(e => e.RoomCareTypeId).HasComment("Identifier for the room/care type association record.");

			entity.Property(e => e.CareTypeId).HasComment("Identifier for the associated care type record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The operator's identifier for the room/care type association.");

			entity.Property(e => e.RoomId).HasComment("Identifier for the associated room record.");

			entity.HasOne(d => d.CareType)
					.WithMany(p => p.RoomCareTypes)
					.HasForeignKey(d => d.CareTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoomCareType_CareType");

			entity.HasOne(d => d.Room)
					.WithMany(p => p.RoomCareTypes)
					.HasForeignKey(d => d.RoomId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoomCareType_Room");
		});
	}

}
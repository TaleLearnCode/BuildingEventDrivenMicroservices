namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomAvailability(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomAvailability>(entity =>
		{
			entity.ToTable("RoomAvailability", "PM");

			entity.HasComment("Represents the communities managed by the tenant provider.");

			entity.HasIndex(e => e.ExternalId, "unqRoomAvailability_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.RoomAvailabilityId).HasComment("Identifier of the room availability record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The external (customer) identifier assigned to the room availability.");

			entity.Property(e => e.RoomAvailabilityName)
					.HasMaxLength(100)
					.HasComment("The name of the room availability type.");

			entity.Property(e => e.RowStatusId).HasDefaultValueSql("((1))");

			entity.Property(e => e.ShowAsAvailable).HasComment("Flag indicating whether the room availability type is shown as available.");

			entity.Property(e => e.ShowAsReserved).HasComment("Flag indicating whether the room availability type is shown as reserved.");

			entity.Property(e => e.SortOrder).HasComment("The sort order of the room availability type within the full listing of room availability types.");
		});
	}

}
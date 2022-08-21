namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomTypeCategory(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomTypeCategory>(entity =>
		{
			entity.ToTable("RoomTypeCategory", "PM");

			entity.HasComment("Represents a room type category.");

			entity.HasIndex(e => e.ExternalId, "unqRoomTypeCategory_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.RoomTypeCategoryId).HasComment("Identifier of the room type category record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the room type category.");

			entity.Property(e => e.RoomTypeCategoryCode)
					.HasMaxLength(20)
					.HasComment("The code associated with the room type category.");

			entity.Property(e => e.RoomTypeCategoryName)
					.HasMaxLength(100)
					.HasComment("Name of the room type category.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the status of the room type category record (i.e. enabled, disabled, etc).");

			entity.Property(e => e.SortOrder).HasComment("The sort order of the room type category within the full listing of room type categories.");
		});
	}

}
namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomStyle(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomStyle>(entity =>
		{
			entity.ToTable("RoomStyle", "PM");

			entity.HasComment("Represents a room style.");

			entity.HasIndex(e => e.ExternalId, "unqRoomStyle_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.RoomStyleId).HasComment("Identifier of the room style record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's external identifier for the style.");

			entity.Property(e => e.RoomStyleCode)
					.HasMaxLength(20)
					.HasComment("The code assigned to the room style.");

			entity.Property(e => e.RoomStyleName)
					.HasMaxLength(100)
					.HasComment("Name of the room style.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the record row status (i.e. enabled, disabled, etc.).");

			entity.Property(e => e.SortOrder).HasComment("The sort order of the room style within the full listing of room styles.");
		});
	}

}
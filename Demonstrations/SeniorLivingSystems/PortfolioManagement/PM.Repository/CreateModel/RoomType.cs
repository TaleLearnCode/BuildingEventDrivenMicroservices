namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomType>(entity =>
		{
			entity.ToTable("RoomType", "PM");

			entity.HasComment("Represents a room type.");

			entity.HasIndex(e => e.ExternalId, "unqRoomType_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.RoomTypeId).HasComment("Identifier of the room type record.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the room type.");

			entity.Property(e => e.RoomStyleId).HasComment("Identifier of the associated room style.");

			entity.Property(e => e.RoomTypeCategoryId).HasComment("Identifier of the category of room type.");

			entity.Property(e => e.RoomTypeCode)
					.HasMaxLength(20)
					.HasComment("A short code for the room type.");

			entity.Property(e => e.RoomTypeName)
					.HasMaxLength(100)
					.HasComment("Name of the room type.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the room type record status (i.e. enabled, disabled, etc).");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the room type among the other room types.");

			entity.HasOne(d => d.RoomStyle)
					.WithMany(p => p.RoomTypes)
					.HasForeignKey(d => d.RoomStyleId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoomType_RoomStyle");

			entity.HasOne(d => d.RoomTypeCategory)
					.WithMany(p => p.RoomTypes)
					.HasForeignKey(d => d.RoomTypeCategoryId)
					.HasConstraintName("fkRoomType_RoomTypeCategory");
		});
	}

}
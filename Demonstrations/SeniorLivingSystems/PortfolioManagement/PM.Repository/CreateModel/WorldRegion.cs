namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void WorldRegion(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<WorldRegion>(entity =>
		{
			entity.HasKey(e => e.WorldRegionCode)
					.HasName("pkcWorldRegion");

			entity.ToTable("WorldRegion", "PM");

			entity.HasComment("Lookup table representing the world regions as defined by the UN M49 specification.");

			entity.HasIndex(e => e.ParentId, "idxWorldRegion_ParentId");

			entity.Property(e => e.WorldRegionCode)
					.HasMaxLength(3)
					.IsUnicode(false)
					.IsFixedLength()
					.HasComment("Identifier of the world region.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the world region is active.");

			entity.Property(e => e.ParentId)
					.HasMaxLength(3)
					.IsUnicode(false)
					.IsFixedLength()
					.HasComment("Identifier of the world region parent (for subregions).");

			entity.Property(e => e.WorldRegionName)
					.HasMaxLength(100)
					.IsUnicode(false)
					.HasComment("Name of the world region.");

			entity.HasOne(d => d.Parent)
					.WithMany(p => p.InverseParent)
					.HasForeignKey(d => d.ParentId)
					.HasConstraintName("fkWorldRegion_WorldRegion");
		});
	}

}
namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityStructureType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityStructureType>(entity =>
		{
			entity.ToTable("CommunityStructureType", "PM");

			entity.HasComment("Represents the type of a community structure (floor, building, etc.).");

			entity.HasIndex(e => e.ExternalId, "unqCommunityStructureType_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.HasIndex(e => e.ExternalId, "unqCommunityStructure_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.CommunityStructureTypeId).HasComment("Identifier of the community structure type record.");

			entity.Property(e => e.CommunityStructureTypeName)
					.HasMaxLength(100)
					.HasComment("The name of the community structure type.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the community structure type.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the community structure record status (i.e. enabled, disabled, etc).");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the community structure type among the other community structure types.");
		});
	}

}
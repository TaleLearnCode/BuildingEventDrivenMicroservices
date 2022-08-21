namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityStructure(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityStructure>(entity =>
		{
			entity.ToTable("CommunityStructure", "PM");

			entity.HasComment("Represents an element of the structure (floor, building, etc.) within a community.");

			entity.Property(e => e.CommunityStructureId).HasComment("Identifier of the community structure record.");

			entity.Property(e => e.CommunityId).HasComment("Identifier of the community the element is defining the structure of.");

			entity.Property(e => e.CommunityStructureCode)
					.HasMaxLength(20)
					.HasComment("The code for the community structure.");

			entity.Property(e => e.CommunityStructureName)
					.HasMaxLength(100)
					.HasComment("The name of the community structure.");

			entity.Property(e => e.CommunityStructureTypeId).HasComment("Identifier of the community structure's type.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the community structure.");

			entity.Property(e => e.ParentId).HasComment("Identifier of the community structure's parent (example the building a floor is in).");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the status of the community attribute type record (i.e. enabled, disabled, etc).");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the community structure among the other community structures.");

			entity.HasOne(d => d.Community)
					.WithMany(p => p.CommunityStructures)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityStructure_Community");

			entity.HasOne(d => d.CommunityStructureType)
					.WithMany(p => p.CommunityStructures)
					.HasForeignKey(d => d.CommunityStructureTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityStructure_CommunityStructureType");

			entity.HasOne(d => d.Parent)
					.WithMany(p => p.InverseParent)
					.HasForeignKey(d => d.ParentId)
					.HasConstraintName("fkCommunityStructure_CommunityStructure");
		});
	}

}
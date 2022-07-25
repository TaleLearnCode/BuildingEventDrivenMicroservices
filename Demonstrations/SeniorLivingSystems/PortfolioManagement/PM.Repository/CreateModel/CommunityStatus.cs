namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityStatus(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityStatus>(entity =>
		{
			entity.ToTable("CommunityStatus", "PM");

			entity.HasComment("Represents the different statuses for a community.");

			entity.HasIndex(e => e.ExternalId, "unqCommunityStatus_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.CommunityStatusId).HasComment("The identifier of the community status record.");

			entity.Property(e => e.CommunityStatusName)
					.HasMaxLength(100)
					.HasComment("The name of the community status.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the community status record.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the Community Status record status (i.e. enabled, disabled, etc).");

			entity.Property(e => e.SortOrder).HasComment("The sorting order of the COmmunity Status among the other community statuses.");
		});
	}

}
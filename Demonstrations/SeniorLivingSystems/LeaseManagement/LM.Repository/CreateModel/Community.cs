namespace SLS.LM.Repository;

internal static partial class CreateModel
{

	internal static void Community(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Community>(entity =>
		{
			entity.ToTable("Community", "LM");

			entity.HasComment("Represents a community run by the tenant.");

			entity.HasIndex(e => e.CommunityNumber, "idxCommunity_CommunityNumber");

			entity.Property(e => e.CommunityId)
					.ValueGeneratedNever()
					.HasComment("The identifier of the community record.");

			entity.Property(e => e.CommunityName)
					.HasMaxLength(200)
					.HasComment("The name of the community.");

			entity.Property(e => e.CommunityNumber)
					.HasMaxLength(50)
					.HasComment("The tenant's number (identifier) for the community.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the community is active or not.");

			entity.Property(e => e.ProfileImageUrl)
					.HasMaxLength(500)
					.IsUnicode(false)
					.HasComment("URL of the profile image for the community.");
		});
	}

}
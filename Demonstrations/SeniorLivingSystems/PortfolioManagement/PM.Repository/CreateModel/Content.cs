namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void Content(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Content>(entity =>
		{
			entity.ToTable("Content", "PM");

			entity.HasComment("Represents content for an item managed by the system.");

			entity.Property(e => e.ContentId).HasComment("Identifier of the Content record.");

			entity.Property(e => e.ContentName)
					.HasMaxLength(100)
					.HasComment("The name of the Content.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The Tenant's identifier for the Content record.");
		});
	}

}
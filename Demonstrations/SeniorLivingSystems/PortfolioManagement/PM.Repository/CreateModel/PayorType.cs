namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void PayorType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<PayorType>(entity =>
		{
			entity.ToTable("PayorType", "PM");

			entity.HasComment("Represents a type of payor.");

			entity.HasIndex(e => e.ExternalId, "unqPayorType_ExternalId")
					.IsUnique()
					.HasFilter("([ExternalId] IS NOT NULL)");

			entity.Property(e => e.PayorTypeId).HasComment("Identifier of the payor type.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the payor type.");

			entity.Property(e => e.PayorTypeName)
					.HasMaxLength(100)
					.HasComment("The name of the payor type.");

			entity.Property(e => e.RowStatusId)
					.HasDefaultValueSql("((1))")
					.HasComment("Identifier of the status for the row (i.e. enabled, disabled, etc.).");

			entity.Property(e => e.SortOrder).HasComment("The sort order of the payor type within the full listing of payor types.");
		});
	}

}
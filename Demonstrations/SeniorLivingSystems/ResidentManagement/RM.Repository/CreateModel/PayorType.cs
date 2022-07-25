namespace SLS.RM.Repository;

internal static partial class CreateModel
{

	internal static void PayorType(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<PayorType>(entity =>
		{
			entity.ToTable("PayorType", "RM");

			entity.HasComment("Represents a type of payor.");

			entity.Property(e => e.PayorTypeId)
					.ValueGeneratedNever()
					.HasComment("Identifier of the payor type.");

			entity.Property(e => e.PayorTypeName)
					.HasMaxLength(100)
					.HasComment("The name of the payor type.");

			entity.Property(e => e.RowStatusId).HasComment("Identifier of the status for the row (i.e. enabled, disabled, etc.).");

			entity.Property(e => e.SortOrder).HasComment("The sort order of the payor type within the full listing of payor types.");
		});
	}

}
namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void LanguageCulture(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<LanguageCulture>(entity =>
		{
			entity.HasKey(e => e.LanguageCultureCode)
					.HasName("pkcLanguageCulture");

			entity.ToTable("LanguageCulture", "PM");

			entity.HasComment("Represents a language with culture differences that is spoken/written.");

			entity.Property(e => e.LanguageCultureCode)
					.HasMaxLength(15)
					.IsUnicode(false)
					.HasComment("Identifier of the language culture record.");

			entity.Property(e => e.CreatedBy)
					.HasMaxLength(100)
					.HasComment("Identifier of the user that created the language culture record.");

			entity.Property(e => e.CreatedDate)
					.HasDefaultValueSql("(getutcdate())")
					.HasComment("The date and time the language culture record was created.");

			entity.Property(e => e.EnglishName)
					.HasMaxLength(100)
					.HasComment("The English name of the language culture.");

			entity.Property(e => e.IsActive)
					.IsRequired()
					.HasDefaultValueSql("((1))")
					.HasComment("Flag indicating whether the language culture is active.");

			entity.Property(e => e.LanguageCode)
					.HasMaxLength(3)
					.IsUnicode(false)
					.IsFixedLength()
					.HasComment("Code for the associated language.");

			entity.Property(e => e.ModifiedBy)
					.HasMaxLength(100)
					.HasComment("Identifier of the user that created the language culture record.");

			entity.Property(e => e.ModifiedDate).HasComment("The date and time the language culture record was created.");

			entity.Property(e => e.NativeName)
					.HasMaxLength(100)
					.HasComment("The native name of the language culture.");
		});
	}

}
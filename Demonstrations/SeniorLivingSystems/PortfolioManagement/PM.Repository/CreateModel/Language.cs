namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void Language(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Language>(entity =>
		{
			entity.HasKey(e => e.LanguageCode)
					.HasName("pkcLangauge");

			entity.ToTable("Language", "PM");

			entity.HasComment("Represents a spoken/written language.");

			entity.Property(e => e.LanguageCode)
					.HasMaxLength(2)
					.IsUnicode(false)
					.IsFixedLength()
					.HasComment("Identifier of the language.");

			entity.Property(e => e.IsActive).HasComment("Flag indicating whether the language is active.");

			entity.Property(e => e.LanguageName)
					.HasMaxLength(100)
					.HasComment("Name of the language.");

			entity.Property(e => e.NativeName)
					.HasMaxLength(100)
					.HasComment("Native name of the language.");
		});
	}

}
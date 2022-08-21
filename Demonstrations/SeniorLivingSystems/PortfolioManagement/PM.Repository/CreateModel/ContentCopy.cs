namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void ContentCopy(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ContentCopy>(entity =>
		{
			entity.HasKey(e => new { e.ContentId, e.LanguageCultureCode })
					.HasName("pkcContentCopy");

			entity.ToTable("ContentCopy", "PM");

			entity.HasComment("Represents content for an item managed by the system.");

			entity.Property(e => e.ContentId).HasComment("Identifier of the associated Content record.");

			entity.Property(e => e.LanguageCultureCode)
					.HasMaxLength(15)
					.IsUnicode(false)
					.HasComment("Identifier of the associated LanguageCulture record.");

			entity.Property(e => e.CopyText).HasComment("The text of the content copy.");

			entity.HasOne(d => d.Content)
					.WithMany(p => p.ContentCopies)
					.HasForeignKey(d => d.ContentId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkContentCopy_Content");

			entity.HasOne(d => d.LanguageCultureCodeNavigation)
					.WithMany(p => p.ContentCopies)
					.HasForeignKey(d => d.LanguageCultureCode)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkContentCopy_LangaugeCulture");
		});
	}

}
namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void CommunityPostalAddress(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<CommunityPostalAddress>(entity =>
		{
			entity.ToTable("CommunityPostalAddress", "PM");

			entity.HasComment("Represents the linking of a community to an address.");

			entity.Property(e => e.City).HasMaxLength(100);

			entity.Property(e => e.CountryCode)
					.HasMaxLength(2)
					.IsUnicode(false)
					.IsFixedLength();

			entity.Property(e => e.CountryDivisionCode)
					.HasMaxLength(3)
					.IsUnicode(false)
					.IsFixedLength();

			entity.Property(e => e.ExternalId).HasMaxLength(100);

			entity.Property(e => e.IsListingAddress).HasComment("Flag indicating whether the associated language is the default listing address for the community.");

			entity.Property(e => e.PostalCode).HasMaxLength(20);

			entity.Property(e => e.StreetAddress1).HasMaxLength(100);

			entity.Property(e => e.StreetAddress2).HasMaxLength(100);

			entity.HasOne(d => d.Community)
					.WithMany(p => p.CommunityPostalAddresses)
					.HasForeignKey(d => d.CommunityId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityPostalAddress_Community");

			entity.HasOne(d => d.CountryCodeNavigation)
					.WithMany(p => p.CommunityPostalAddresses)
					.HasForeignKey(d => d.CountryCode)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkCommunityPostalAddress_Country");

			entity.HasOne(d => d.PostalAddressType)
					.WithMany(p => p.CommunityPostalAddresses)
					.HasForeignKey(d => d.PostalAddressTypeId)
					.HasConstraintName("fkCommunityPostalAddress_PostalAddressType");

			entity.HasOne(d => d.Country)
					.WithMany(p => p.CommunityPostalAddresses)
					.HasForeignKey(d => new { d.CountryCode, d.CountryDivisionCode })
					.HasConstraintName("fkCommunityPostalAddress_CountryDivision");
		});
	}

}
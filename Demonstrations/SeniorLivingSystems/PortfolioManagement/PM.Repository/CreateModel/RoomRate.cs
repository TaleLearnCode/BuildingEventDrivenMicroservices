namespace SLS.PM.Repository;

internal static partial class CreateModel
{

	internal static void RoomRate(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<RoomRate>(entity =>
		{
			entity.ToTable("RoomRate", "PM");

			entity.HasComment("Represents the rate information for a room for a specific set of dates..")
					.ToTable(tb => tb.IsTemporal(ttb =>
					{
						ttb.UseHistoryTable("RoomRateHistory", "PM");
						ttb
													.HasPeriodStart("ValidFrom")
													.HasColumnName("ValidFrom");
						ttb
													.HasPeriodEnd("ValidTo")
													.HasColumnName("ValidTo");
					}
));

			entity.HasIndex(e => e.RoomId, "INDEX_RoomRateID");

			entity.HasIndex(e => new { e.PayorTypeId, e.RoomId, e.EffectiveStartDate, e.EffectiveEndDate }, "ncixRoomRate_EffectiveDates");

			entity.Property(e => e.RoomRateId).HasComment("Identifier of the room rate.");

			entity.Property(e => e.AdministrativeFee)
					.HasColumnType("smallmoney")
					.HasComment("The standard administrative fee applied to the room.");

			entity.Property(e => e.BaseRate)
					.HasColumnType("smallmoney")
					.HasComment("The base (MSRP) rate for the room, room rate type, and payor type.");

			entity.Property(e => e.DailyRate)
					.HasColumnType("smallmoney")
					.HasComment("The daily rate for the room.");

			entity.Property(e => e.DiscountedRate)
					.HasColumnType("smallmoney")
					.HasComment("The discounted rate (starting at) for the room.");

			entity.Property(e => e.EffectiveEndDate)
					.HasDefaultValueSql("('9999-12-31 23:59:59')")
					.HasComment("The date and time the rate information is no longer effective.");

			entity.Property(e => e.EffectiveStartDate)
					.HasDefaultValueSql("(getutcdate())")
					.HasComment("The date and time the rate information is effective.");

			entity.Property(e => e.ExternalId)
					.HasMaxLength(100)
					.HasComment("The tenant's identifier for the room rate.");

			entity.Property(e => e.MaxConcession)
					.HasColumnType("smallmoney")
					.HasComment("The max concession allowed for the room.");

			entity.Property(e => e.MaximumRate)
					.HasColumnType("smallmoney")
					.HasComment("The maximum amount accepted for the room.");

			entity.Property(e => e.MinimumRate)
					.HasColumnType("smallmoney")
					.HasComment("The minimum amount accepted for the room.");

			entity.Property(e => e.PayorTypeId).HasComment("Identifier of the associated payor type.");

			entity.Property(e => e.RoomId).HasComment("Identifier of the associated room.");

			entity.Property(e => e.RowStatusId).HasDefaultValueSql("((1))");

			entity.HasOne(d => d.PayorType)
					.WithMany(p => p.RoomRates)
					.HasForeignKey(d => d.PayorTypeId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoomRate_PayorType");

			entity.HasOne(d => d.Room)
					.WithMany(p => p.RoomRates)
					.HasForeignKey(d => d.RoomId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkRoomRate_Room");
		});
	}

}
namespace SLS.RM.Repository;

internal static partial class CreateModel
{

	internal static void ResidentRoom(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<ResidentRoom>(entity =>
		{
			entity.ToTable("ResidentRoom", "RM");

			entity.HasOne(d => d.Resident)
					.WithMany(p => p.ResidentRooms)
					.HasForeignKey(d => d.ResidentId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkResidentRoom_Resident");

			entity.HasOne(d => d.Room)
					.WithMany(p => p.ResidentRooms)
					.HasForeignKey(d => d.RoomId)
					.OnDelete(DeleteBehavior.ClientSetNull)
					.HasConstraintName("fkResidentRoom_Room");
		});
	}

}
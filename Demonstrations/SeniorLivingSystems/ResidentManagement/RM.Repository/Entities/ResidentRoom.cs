namespace SLS.RM.Repository.Entities;

public partial class ResidentRoom
{

	public int ResidentRoomId { get; set; }
	public int ResidentId { get; set; }
	public int RoomId { get; set; }

	public virtual Resident Resident { get; set; } = null!;
	public virtual Room Room { get; set; } = null!;

}
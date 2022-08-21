namespace SLS.EventMessages.CM;

/// <summary>
/// Represents the message sent when a resident's care type is changed
/// </summary>
public class ResidentCareTypeChange : EventMessage
{

	public ResidentCareTypeChange()
	{
		MessageType = nameof(ResidentCareTypeChange);
	}

	/// <summary>
	/// Identifier of the resident whose care type is being changed.
	/// </summary>
	public int ResidentId { get; set; }

	/// <summary>
	/// Identifier of the room whose care type is being changed.
	/// </summary>
	public int RoomId { get; set; }

	/// <summary>
	/// Identifier of the new care type to be provided to the resident.
	/// </summary>
	public int CareTypeId { get; set; }

	/// <summary>
	/// The rate to be charged to the resident.
	/// </summary>
	public decimal RoomRate { get; set; }

}
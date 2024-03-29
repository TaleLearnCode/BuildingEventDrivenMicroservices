﻿namespace SLS.RM.Repository.Entities;

/// <summary>
/// Represents a community run by the tenant.
/// </summary>
public partial class Community
{

	public Community()
	{
		Residents = new HashSet<Resident>();
		Rooms = new HashSet<Room>();
	}

	/// <summary>
	/// The identifier of the community record.
	/// </summary>
	public int CommunityId { get; set; }
	/// <summary>
	/// The tenant&apos;s number (identifier) for the community.
	/// </summary>
	public string CommunityNumber { get; set; } = null!;
	/// <summary>
	/// The name of the community.
	/// </summary>
	public string CommunityName { get; set; } = null!;
	/// <summary>
	/// URL of the profile image for the community.
	/// </summary>
	public string? ProfileImageUrl { get; set; }
	/// <summary>
	/// Flag indicating whether the community is active or not.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual ICollection<Resident> Residents { get; set; }
	public virtual ICollection<Room> Rooms { get; set; }

}
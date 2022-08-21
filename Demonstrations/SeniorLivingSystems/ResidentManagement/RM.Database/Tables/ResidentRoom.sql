CREATE TABLE RM.ResidentRoom
(
  ResidentRoomId INT NOT NULL IDENTITY(1,1),
  ResidentId     INT NOT NULL,
  RoomId         INT NOT NULL,
  CONSTRAINT pkcResidentRoom PRIMARY KEY CLUSTERED (ResidentRoomId),
  CONSTRAINT fkResidentRoom_Resident FOREIGN KEY (ResidentId) REFERENCES RM.Resident (ResidentId),
  CONSTRAINT fkResidentRoom_Room     FOREIGN KEY (RoomId)     REFERENCES RM.Room (RoomId)
)
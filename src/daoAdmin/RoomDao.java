package daoAdmin;

import pojoAdmin.Room;

import java.util.List;

public interface RoomDao {
    List<Room> getAllRoom();

    Room queryRoom(String roomid);

    boolean addRoom(Room room);

    boolean updateRoom(Room room);

    boolean deleteRoom(String roomid);

    Room findRoomById(String roomid);
}

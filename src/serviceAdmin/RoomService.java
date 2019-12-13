package serviceAdmin;

import pojoAdmin.Room;

import java.util.List;

public interface RoomService {

    List<Room> getAllRoom();

    Room queryRoom(String roomid);

    boolean updateRoom(Room room);

    boolean deleteRoom(String room);

    boolean insertRoom(Room room);

//    boolean insertUserNumber(Room room);

    Room searchRoom(String roomid);
}

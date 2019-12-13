package serviceAdmin.impl;

import daoAdmin.RoomDao;
import daoAdmin.impl.RoomDaoImpl;
import pojoAdmin.Room;
import serviceAdmin.RoomService;

import java.util.List;

public class RoomServiceImpl implements RoomService {
    @Override
    public List<Room> getAllRoom() {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.getAllRoom();
    }

    @Override
    public Room queryRoom(String roomid) {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.queryRoom(roomid);
    }

    @Override
    public boolean updateRoom(Room room) {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.updateRoom(room);
    }

    @Override
    public boolean deleteRoom(String room) {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.deleteRoom(room);
    }

    @Override
    public boolean insertRoom(Room room) {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.addRoom(room);
    }

    @Override
    public Room searchRoom(String roomid) {
        RoomDao roomDao = new RoomDaoImpl();
        return roomDao.findRoomById(roomid);
    }
}

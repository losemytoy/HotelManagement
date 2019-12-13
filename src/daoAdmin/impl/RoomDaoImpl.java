package daoAdmin.impl;

import daoAdmin.RoomDao;
import db.MyDatabase;
import pojoAdmin.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDaoImpl implements RoomDao {
    @Override
    public List<Room> getAllRoom() {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM tb_room");
            rs = ps.executeQuery();
            ArrayList<Room> list = new ArrayList<>();
            while (rs.next()){
                Room room = new Room();
                room.setRoom_id(rs.getString(1));
                room.setRoom_stat(rs.getString(2));
                room.setRoom_price(rs.getString(3));
                list.add(room);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            if(rs != null){
                MyDatabase.close(rs,ps,connection);
            }
        }
    }

    @Override
    public Room queryRoom(String id) {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("SELECT * FROM tb_room WHERE room_id=?");
            ps.setString(1,id);
            rs=ps.executeQuery();

            if (rs.next()){
                Room room = new Room();
                room.setRoom_id(rs.getString(1));
                room.setRoom_stat(rs.getString(2));
                room.setRoom_price(rs.getString(3));
                return room;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }finally {
            if(rs != null){
                MyDatabase.close(rs,ps,connection);
            }
        }
    }

    @Override
    public boolean addRoom(Room room) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("INSERT INTO tb_room(room_id,room_stat,room_price) VALUES (?,?,?)");
            ps.setString(1, room.getRoom_id());
            ps.setString(2, room.getRoom_stat());
            ps.setString(3, room.getRoom_price());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(null, ps, connection);
        }
    }

    @Override
    public boolean updateRoom(Room room) {
        Connection connection= MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps=null;

        try {
            ps = connection.prepareStatement("UPDATE tb_room SET room_price=? WHERE room_id=?");
            ps.setString(1, room.getRoom_price());
            ps.setString(2, room.getRoom_id());
            int result = ps.executeUpdate();
            return result>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;

        } finally {
            MyDatabase.close(null,ps,connection);
        }
    }

    @Override
    public boolean deleteRoom(String roomid) {
        Connection connection = MyDatabase.getConnection();
        if(connection == null){
            return false;
        }
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("DELETE FROM tb_room WHERE room_id=?");
            ps.setString(1,roomid);
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            MyDatabase.close(null,ps,connection);
        }
    }

    @Override
    public Room findRoomById(String roomid) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null)
            return null;
        ResultSet rs = null;
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT * FROM tb_room WHERE room_id=?");
            statement.setString(1, roomid);
            rs = statement.executeQuery();
            if (rs.first()) {
                Room room = new Room();
                room.setRoom_id("room_id");
                room.setRoom_stat("room_stat");
                room.setRoom_price("room_price");
                return room;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            MyDatabase.close(rs,statement,connection);
        }
    }
}

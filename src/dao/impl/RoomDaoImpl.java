package dao.impl;

import dao.RoomDao;
import db.MyDatabase;
import pojo.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDaoImpl implements RoomDao{
    @Override
    public List<Room> getAllRoom() {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;

        try{
            ps = connection.prepareStatement("SELECT room_id,room_stat,room_price FROM tb_room where room_stat='有'");
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

}

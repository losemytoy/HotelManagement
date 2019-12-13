package dao.impl;

import dao.OrderDao;
import db.MyDatabase;
import pojo.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao{
    @Override
    public List<Order> getAllOrder() {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;

        try{
            ps = connection.prepareStatement("SELECT order_id,tb_user_room.user_account,room_id FROM tb_user_room,tb_usernumber WHERE tb_user_room.user_account = tb_usernumber.user_account and tb_user_room.user_account=user_now");
            rs = ps.executeQuery();
            ArrayList<Order> list = new ArrayList<>();
            while (rs.next()){
                Order order = new Order();
                order.setOrder_id(rs.getString(1));
                order.setUser_account(rs.getString(2));
                order.setRoom_id(rs.getString(3));
                list.add(order);
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
    public Order queryOrder(String account) {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("SELECT order_id,tb_user_room.user_account,room_id FROM tb_user_room,tb_usernumber WHERE tb_user_room.user_account = tb_usernumber.user_account AND tb_user_room.user_account=?");
            ps.setString(1,account);
            rs=ps.executeQuery();

            if (rs.next()){
                Order order = new Order();
                order.setOrder_id(rs.getString(1));
                order.setUser_account(rs.getString(2));
                order.setRoom_id(rs.getString(3));
                return order;
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
    public boolean updateOrder(Order order) {
        Connection connection=MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps=null;

        try {
            ps = connection.prepareStatement("UPDATE tb_user_room SET order_id=?,user_account=?,room_id=? WHERE user_account=?");
            ps.setString(1, order.getOrder_id());
            ps.setString(2, order.getUser_account());
            ps.setString(3, order.getRoom_id());
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
    public boolean deleteOrder(String account) {
        Connection connection = MyDatabase.getConnection();
        if(connection == null){
            return false;
        }
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("DELETE FROM tb_user_room WHERE order_id=?");
            ps.setString(1,account);
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            MyDatabase.close(null,ps,connection);
        }
    }
    public Order getroomid(Order order){
        Connection connection = MyDatabase.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Order ad = null;
        try {
            ps = connection.prepareStatement( "select order_id,user_account,room_id from tb_user_room where room_id=?");
            ps.setString(1,order.getRoom_id());
            rs = ps.executeQuery();
            while(rs.next()){
                ad = new Order();
                ad.setRoom_id(rs.getString("room_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyDatabase.close(null, ps, connection);
        }
        return ad;
    }
    @Override
    public boolean addOrder(Order order) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("INSERT INTO tb_user_room(order_id,user_account,room_id) VALUES (?,?,?)");
            ps.setString(1, order.getOrder_id());
            ps.setString(2, order.getUser_account());
            ps.setString(3, order.getRoom_id());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(null, ps, connection);
        }
    }
}

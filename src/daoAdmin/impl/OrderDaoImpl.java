package daoAdmin.impl;

import daoAdmin.OrderDao;
import db.MyDatabase;
import pojoAdmin.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    @Override
    public List<Order> getAllOrder() {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("SELECT * FROM tb_user_room");
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
    public boolean deleteOrder(String orderid) {
        Connection connection = MyDatabase.getConnection();
        if(connection == null){
            return false;
        }
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("DELETE FROM tb_user_room WHERE order_id=?");
            ps.setString(1,orderid);
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            MyDatabase.close(null,ps,connection);
        }
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

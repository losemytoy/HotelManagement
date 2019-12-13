package dao.impl;

import dao.UserDao;
import db.MyDatabase;
import pojo.Customer;
import pojo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{
    @Override
    public boolean findUserByAccount(String account) {
        return false;
    }

    @Override
    public User checkUser(String account, String pwd) {
        Connection connection=new MyDatabase().getConnection();
        ResultSet rs=null;
        PreparedStatement ps=null;


        try {
            ps=connection.prepareStatement("SELECT * FROM  tb_usernumber WHERE user_account=? AND user_pwd=?");
            ps.setString(1,account);
            ps.setString(2,pwd);
            rs=ps.executeQuery();
            if(rs.next()){
                User user = new User();
                user.setUser_account(rs.getString(1));
                user.setUser_pwd(rs.getString(2));
                return user;
            }
            return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            if (rs !=null){
                MyDatabase.close(rs,ps,connection);
            }
        }
    }
    @Override
    public boolean updateUser(String user_now) {
        Connection connection=MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps=null;

        try {
            ps = connection.prepareStatement("UPDATE tb_usernumber SET user_now=?");
            ps.setString(1,user_now);
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
    public boolean findUserByName(String user_account) {
        Connection connection=MyDatabase.getConnection();
        if (connection == null) return false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM tb_user WHERE user_account=?");
            ps.setString(1, user_account);
            rs = ps.executeQuery();
            return rs.first();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(rs, ps, connection);
        }
    }

    @Override
    public boolean insertUser(Customer customer) {
        Connection connection=MyDatabase.getConnection();
        if (connection == null) return false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement("INSERT tb_usernumber(user_account, user_pwd) VALUES (?,?)" +
                    "INSERT tb_user(user_account) VALUES (?)");

            ps.setString(1, customer.getUser_account());
            ps.setString(2, customer.getUser_pwd());
            ps.setString(3, customer.getUser_account());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(rs, ps, connection);
        }
    }
}

package daoAdmin.impl;

import daoAdmin.CustomerDao;
import db.MyDatabase;
import pojoAdmin.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoImpl implements CustomerDao{

    @Override
    public List<Customer> getAllCustomer() {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("SELECT tb_user.user_account,user_pwd,user_name,user_sex,user_age,user_sfz,user_tel FROM tb_user,tb_usernumber WHERE tb_user.user_account = tb_usernumber.user_account");
            rs = ps.executeQuery();
            ArrayList<Customer> list = new ArrayList<>();
            while (rs.next()){
                Customer customer = new Customer();
                customer.setUser_account(rs.getString(1));
                customer.setUser_pwd(rs.getString(2));
                customer.setUser_name(rs.getString(3));
                customer.setUser_sex(rs.getString(4));
                customer.setUser_age(rs.getString(5));
                customer.setUser_sfz(rs.getString(6));
                customer.setUser_tel(rs.getString(7));
                list.add(customer);
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
    public Customer queryCustomer(String account) {
        Connection connection = new MyDatabase().getConnection();
        ResultSet rs = null;
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("SELECT tb_user.user_account,user_pwd,user_name,user_sex,user_age,user_sfz,user_tel FROM tb_user,tb_usernumber WHERE tb_user.user_account = tb_usernumber.user_account AND tb_user.user_account=?");
            ps.setString(1,account);
            rs=ps.executeQuery();

            if (rs.next()){
                Customer customer = new Customer();
                customer.setUser_account(rs.getString(1));
                customer.setUser_pwd(rs.getString(2));
                customer.setUser_name(rs.getString(3));
                customer.setUser_sex(rs.getString(4));
                customer.setUser_age(rs.getString(5));
                customer.setUser_sfz(rs.getString(6));
                customer.setUser_tel(rs.getString(7));
                return customer;
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
    public boolean addUser(Customer customer) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("INSERT INTO tb_user(user_name,user_sex,user_age,user_sfz,user_tel) VALUES (?,?,?,?,?)");
            ps.setString(1, customer.getUser_name());
            ps.setString(2, customer.getUser_sex());
            ps.setString(3, customer.getUser_age());
            ps.setString(4, customer.getUser_sfz());
            ps.setString(5, customer.getUser_tel());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(null, ps, connection);
        }
    }

    @Override
    public boolean addUserNumber(Customer customer) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("INSERT INTO tb_usernumber(user_account,user_pwd) VALUES (?,?)");
            ps.setString(1, customer.getUser_account());
            ps.setString(2, customer.getUser_pwd());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            MyDatabase.close(null, ps, connection);
        }
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        Connection connection= MyDatabase.getConnection();
        if (connection == null) {
            return false;
        }
        PreparedStatement ps=null;

        try {
            ps = connection.prepareStatement("UPDATE tb_user SET user_name=?,user_sex=?,user_age=?,user_sfz=?,user_tel=? WHERE user_account=?");
            ps.setString(1, customer.getUser_name());
            ps.setString(2, customer.getUser_sex());
            ps.setString(3, customer.getUser_age());
            ps.setString(4,customer.getUser_sfz());
            ps.setString(5,customer.getUser_tel());
            ps.setString(6,customer.getUser_account());
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
    public boolean deleteCustomer(String account) {
        Connection connection = MyDatabase.getConnection();
        if(connection == null){
            return false;
        }
        PreparedStatement ps = null;
        try{
            ps = connection.prepareStatement("DELETE FROM tb_usernumber WHERE user_account=?");
            ps.setString(1,account);
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            MyDatabase.close(null,ps,connection);
        }
    }

    @Override
    public Customer findCustomerByAc(String account) {
        Connection connection = MyDatabase.getConnection();
        if (connection == null)
            return null;
        ResultSet rs = null;
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT * FROM tb_user WHERE user_account=?");
            statement.setString(1, account);
            rs = statement.executeQuery();
            if (rs.first()) {
                Customer customer = new Customer();
                customer.setUser_account("user_account");
                customer.setUser_name("user_name");
                customer.setUser_sex("user_sex");
                customer.setUser_age("user_age");
                customer.setUser_sfz("user_sfz");
                customer.setUser_tel("user_tel");
                return customer;
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

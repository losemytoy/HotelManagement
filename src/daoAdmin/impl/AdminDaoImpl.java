package daoAdmin.impl;

import daoAdmin.AdminDao;
import db.MyDatabase;
import pojoAdmin.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDaoImpl implements AdminDao{
    @Override
    public boolean findAdminByAccount(String account) {
        return false;
    }

    @Override
    public boolean insertAdmin(Admin admin) {
        return false;
    }

    @Override
    public Admin checkAdmin(String account, String pwd) {
        Connection connection=new MyDatabase().getConnection();
        ResultSet rs=null;
        PreparedStatement ps=null;


        try {
            ps=connection.prepareStatement("SELECT * FROM  tb_admin WHERE admin_account=? AND admin_pwd=?");
            ps.setString(1,account);
            ps.setString(2,pwd);
            rs=ps.executeQuery();
            if(rs.next()){
                Admin admin = new Admin();
                admin.setAdmin_account(rs.getString(1));
                admin.setAdmin_pwd(rs.getString(2));
                admin.setLevel(rs.getInt(3));
                return admin;
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
}

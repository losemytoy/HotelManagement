package db;

import java.sql.*;

public class MyDatabase {
    static {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        try{
            return DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Room_Management","sa","123456");
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public static void close(ResultSet rs, PreparedStatement ps,Connection connection){
        try{
            if(rs!=null){
                rs.close();
            }
            if(ps!=null){
                ps.close();
            }
            if(connection!=null){
                ps.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}

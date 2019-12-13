package dao;

import pojo.Customer;
import pojo.User;

import java.util.List;

public interface UserDao {
    boolean findUserByAccount(String account);

    boolean insertUser(Customer customer);

    User checkUser(String account,String pwd);       //核对账号密码

    boolean updateUser(String user_now);

    boolean findUserByName(String user_account);

}

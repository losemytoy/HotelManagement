package service.impl;

import dao.CustomerDao;
import dao.UserDao;
import dao.impl.CustomerDaoImpl;
import dao.impl.UserDaoImpl;
import pojo.Customer;
import pojo.User;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

public class UserServiceImpl implements UserService {
    @Override
    public boolean UserSignIn(User user, HttpSession session) {
        ResultSet rs=null;
        UserDao userDao = new UserDaoImpl();
        User user1 = userDao.checkUser(user.getUser_account(),user.getUser_pwd());
        session.setAttribute("user",user1.getUser_account());
        boolean user2 = userDao.updateUser((String) session.getAttribute("user"));
        return user1 != null;
    }

    @Override
    public boolean signUp(Customer customer) {
        UserDao userDao = new UserDaoImpl();

        if (userDao.findUserByName(customer.getUser_account())) {
            return false;
        } else {
            userDao.insertUser(customer);
            return true;
        }
    }
}

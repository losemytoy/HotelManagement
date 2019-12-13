package service;

import pojo.Customer;
import pojo.User;

import javax.servlet.http.HttpSession;

public interface UserService {

    boolean UserSignIn(User user,HttpSession session);

    boolean signUp(Customer customer);
}

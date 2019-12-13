package dao;

import pojo.Order;

import java.util.List;

public interface OrderDao {
    List<Order> getAllOrder();

    Order queryOrder(String account);

    boolean updateOrder(Order order);

    boolean deleteOrder(String customer);

    boolean addOrder(Order order);

    Order getroomid(Order order);
}

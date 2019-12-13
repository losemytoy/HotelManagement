package service;

import pojo.Order;

import java.util.List;

public interface OrderService {
    List<Order> getAllOrder();

    Order queryOrder(String account);

    boolean updateOrder(Order order);

    boolean deleteOrder(String order);

    boolean insertOrder(Order order);
}

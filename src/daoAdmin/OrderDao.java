package daoAdmin;

import pojoAdmin.Order;

import java.util.List;

public interface OrderDao {
    List<Order> getAllOrder();

    boolean deleteOrder(String orderid);

    boolean addOrder(Order order);
}

package serviceAdmin;

import pojoAdmin.Order;

import java.util.List;

public interface OrderService {

    List<Order> getAllOrder();

    boolean deleteOrder(String order);

    boolean insertOrder(Order order);
}

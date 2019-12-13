package serviceAdmin.impl;

import daoAdmin.OrderDao;
import daoAdmin.impl.OrderDaoImpl;
import pojoAdmin.Order;
import serviceAdmin.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    @Override
    public List<Order> getAllOrder() {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.getAllOrder();
    }

    @Override
    public boolean deleteOrder(String order) {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.deleteOrder(order);
    }

    @Override
    public boolean insertOrder(Order order) {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.addOrder(order);
    }
}

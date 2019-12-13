package service.impl;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import pojo.Order;
import service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService{
    @Override
    public List<Order> getAllOrder() {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.getAllOrder();
    }

    @Override
    public Order queryOrder(String account) {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.queryOrder(account);
    }

    @Override
    public boolean updateOrder(Order order) {
        OrderDao orderDao = new OrderDaoImpl();
        return orderDao.updateOrder(order);
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

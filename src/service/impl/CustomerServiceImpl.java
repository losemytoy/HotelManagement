package service.impl;

import dao.CustomerDao;
import dao.impl.CustomerDaoImpl;
import pojo.Customer;
import service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService{


    @Override
    public List<Customer> getAllCustomer() {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.getAllCustomer();
    }

    @Override
    public Customer queryCustomer(String account) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.queryCustomer(account);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.updateCustomer(customer);
    }

}

package serviceAdmin.impl;

import daoAdmin.CustomerDao;
import daoAdmin.impl.CustomerDaoImpl;
import pojoAdmin.Customer;
import serviceAdmin.CustomerService;

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

    @Override
    public boolean deleteCustomer(String customer) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.deleteCustomer(customer);
    }

    @Override
    public boolean insertUser(Customer customer) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.addUser(customer);
    }

    @Override
    public boolean insertUserNumber(Customer customer) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.addUserNumber(customer);
    }

    @Override
    public Customer searchCustomer(String account) {
        CustomerDao customerDao = new CustomerDaoImpl();
        return customerDao.findCustomerByAc(account);
    }
}

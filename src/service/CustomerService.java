package service;

import pojo.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> getAllCustomer();

    Customer queryCustomer(String account);

    boolean updateCustomer(Customer customer);


}

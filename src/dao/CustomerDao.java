package dao;

import pojo.Customer;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CustomerDao {
    List<Customer> getAllCustomer();

    Customer queryCustomer(String account);

    boolean updateCustomer(Customer customer);


}

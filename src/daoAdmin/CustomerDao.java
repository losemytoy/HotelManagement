package daoAdmin;

import pojoAdmin.Customer;

import java.util.List;

public interface CustomerDao {
    List<Customer> getAllCustomer();

    Customer queryCustomer(String account);

    boolean addUser(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(String customer);

    boolean addUserNumber(Customer customer);

    Customer findCustomerByAc(String account);

}

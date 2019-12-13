package serviceAdmin;

import pojoAdmin.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> getAllCustomer();

    Customer queryCustomer(String account);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(String customer);

    boolean insertUser(Customer customer);

    boolean insertUserNumber(Customer customer);

    Customer searchCustomer(String account);
}

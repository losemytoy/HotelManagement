package servletAdmin;

import pojoAdmin.Customer;
import serviceAdmin.CustomerService;
import serviceAdmin.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CustomerServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = new Customer();
        String method = req.getParameter("method");
        if (method == null){
            method = "1";
        }
        switch (method){
            case "1":
                listCus(req, resp);
                break;
            case "2":
                findCustomer(req, resp);
                break;
            case "3":
                updateCustomer(req, resp);
                break;
            case "4":
                deleteCustomer(req, resp);
                break;
            case "5":
                addUserNumber(req, resp);
                break;
            case "6":
                searchCus(req,resp);
                break;


        }
    }


    private void findCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService service=new CustomerServiceImpl();
        String id=req.getParameter("account");
        Customer customer = service.queryCustomer(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("modityAdmin.jsp");
        req.setAttribute("customer",customer);
        dispatcher.forward(req,resp);
    }

    private String formatStr(String string){
        return string==null?"":string;
    }


    private void updateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("useraccount");
        String cusname = req.getParameter("username");
        if (cusname != null){
            Customer customer = new Customer();
            customer.setUser_account(id);
            customer.setUser_name(cusname);
            customer.setUser_sex(formatStr(req.getParameter("usersex")));
            customer.setUser_age(formatStr(req.getParameter("userage")));
            customer.setUser_sfz(formatStr(req.getParameter("usersfz")));
            customer.setUser_tel(formatStr(req.getParameter("usertel")));
            CustomerService customerService = new CustomerServiceImpl();
            customerService.updateCustomer(customer);
        }
        listCus(req,resp);
    }

    private void listCus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService customerService = new CustomerServiceImpl();
        List<Customer> customers = customerService.getAllCustomer();
        RequestDispatcher dispatcher = req.getRequestDispatcher("CustomerListAdmin.jsp");
        req.setAttribute("customer", customers);
        dispatcher.forward(req, resp);
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String id = req.getParameter("account");
        CustomerService customerService = new CustomerServiceImpl();
        if (customerService.deleteCustomer(id)) {
            req.setAttribute("result", "<script language'javascript'>alert('删除成功');</script>");
        } else {
            req.setAttribute("result", "<script language'javascript'>alert('删除失败');</script>");
        }
        listCus(req, resp);
    }

    private void addUserNumber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerAccount=req.getParameter("useraccount");
        if (customerAccount != null) {
            String  customerpwd= req.getParameter("user_pwd");
            Customer customer=new Customer();
            customer.setUser_account(customerAccount);
            customer.setUser_pwd(customerpwd);
            CustomerService customerService=new CustomerServiceImpl();
            String result;
            if(customerService.insertUserNumber(customer)){
                result="成功添加";
            }else {
                result = "添加失败";
            }
            req.setAttribute("result",result);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("addUserNumber.jsp");
        dispatcher.forward(req, resp);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerName=req.getParameter("username");
        if (customerName != null) {
            String  customersex= req.getParameter("usersex");
            String  customerage= req.getParameter("userage");
            String  customersfz= req.getParameter("usersfz");
            String  customertel= req.getParameter("usertel");
            Customer customer=new Customer();
            customer.setUser_name(customerName);
            customer.setUser_sex(customersex);
            customer.setUser_age(customerage);
            customer.setUser_sfz(customersfz);
            customer.setUser_tel(customertel);

        }
    }

    private void searchCus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService service=new CustomerServiceImpl();
        String id=req.getParameter("account");
        Customer customer = service.queryCustomer(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("SearchList.jsp");
        req.setAttribute("customer",customer);
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

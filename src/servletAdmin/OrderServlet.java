package servletAdmin;

import pojoAdmin.Order;
import serviceAdmin.OrderService;
import serviceAdmin.impl.OrderServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/ad.do")
public class OrderServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order = new Order();
        String method = req.getParameter("method");
        if(method == null){
            method = "1";
        }
        switch (method){
            case "1":
                listOrder(req, resp);
                break;
            case "2":
                deleteOrder(req, resp);
                break;
            case "3":
                addOrder(req, resp);
                break;

        }
    }

    private void listOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderServiceImpl();
        List<Order> orders = orderService.getAllOrder();
        RequestDispatcher dispatcher = req.getRequestDispatcher("OrderListAdmin.jsp");
        req.setAttribute("order", orders);
        dispatcher.forward(req, resp);
    }

    private void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String id = req.getParameter("orderid");
        OrderService orderService = new OrderServiceImpl();
        if (orderService.deleteOrder(id)) {
            req.setAttribute("result", "<script language'javascript'>alert('删除成功');</script>");
        } else {
            req.setAttribute("result", "<script language'javascript'>alert('删除失败');</script>");
        }
        listOrder(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private String formatStr(String string){
        return string==null?"":string;
    }

    private void addOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order=new Order();
        order.setOrder_id(formatStr(req.getParameter("order_id")));
        order.setUser_account(formatStr(req.getParameter("user_account")));
        order.setRoom_id(formatStr(req.getParameter("room_id")));

        OrderService orderService=new OrderServiceImpl();
        if (orderService.insertOrder(order)) {
            req.setAttribute("result", "<script language=javascript>alert('订房成功！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("OrderListAdmin.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("result", "<script language=javascript>alert('订房失败！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("RoomListUser.jsp");
            dispatcher.forward(req, resp);
        }

    }
}

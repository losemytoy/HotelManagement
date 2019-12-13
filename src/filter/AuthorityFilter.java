//package filter;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebFilter(urlPatterns = "/hello")
//public class AuthorityFilter implements javax.servlet.Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        HttpSession session = request.getSession();
//        String userName = (String) session.getAttribute("adminno");
//        int level = (Integer) session.getAttribute("level");
//        int method = Integer.parseInt(request.getParameter("method"));
//        if (userName != null) {
//            if (level == 0) {
//                filterChain.doFilter(servletRequest, servletResponse);
//            } else {
//                if (method == 2 || method == 5) {
//                    PrintWriter out = servletResponse.getWriter();
//                    out.println("权限不足，拒绝访问");
//                } else {
//                    filterChain.doFilter(servletRequest, servletResponse);
//                }
//            }
//        } else {
//            PrintWriter out = servletResponse.getWriter();
//            out.println("拒绝访问");
//        }
//    }
//    @Override
//    public void destroy() {
//
//    }
//}
package serviceAdmin.impl;

import daoAdmin.AdminDao;
import daoAdmin.impl.AdminDaoImpl;
import pojoAdmin.Admin;
import serviceAdmin.AdminService;

import javax.servlet.http.HttpSession;

public class AdminServiceImpl implements AdminService{

    @Override
    public boolean AdminSignIn(Admin admin, HttpSession session) {
        AdminDao adminDao = new AdminDaoImpl();
        Admin admin1 = adminDao.checkAdmin(admin.getAdmin_account(),admin.getAdmin_pwd());
        session.setAttribute("adminno",admin1.getAdmin_account());
        session.setAttribute("level",admin1.getLevel());

        return admin1 != null;
    }
}

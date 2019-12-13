package serviceAdmin;

import pojoAdmin.Admin;

import javax.servlet.http.HttpSession;

public interface AdminService {

    boolean AdminSignIn(Admin admin, HttpSession session);
}

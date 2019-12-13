package daoAdmin;

import pojoAdmin.Admin;

public interface AdminDao {
    boolean findAdminByAccount(String account);

    boolean insertAdmin(Admin admin);

    Admin checkAdmin(String account, String pwd);       //核对账号密码

}

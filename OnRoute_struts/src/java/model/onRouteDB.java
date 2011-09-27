/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.myapp.struts.EditRouteForm;
import com.myapp.struts.EditUserForm;
import com.myapp.struts.InsertRouteForm;
import com.myapp.struts.LoginForm;
import com.myapp.struts.ParticipantForm;
import com.myapp.struts.RegistrationForm;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author javidgon
 */
public class onRouteDB {

    private static final SqlMapClient sqlMap;

    static {
        try {
            String resource = "model/sqlIbatisMapConfig.xml";
            Reader reader = Resources.getResourceAsReader(resource);
            sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
        } catch (Exception e) {
            throw new RuntimeException("Error initializing MyAppSqlConfig"
                    + " class. Cause: " + e);
        }
    }

    // ---------------------------------------------------------------------------
    public static void createUser(RegistrationForm u)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.insert("insertUser", u);
    }

    public static List<RegistrationForm> getUsers()
            throws SQLException, ClassNotFoundException, IOException {
        return (List) sqlMap.queryForList("getUsers");
    }

    public static String loginUser(LoginForm u)
            throws SQLException, ClassNotFoundException, IOException {
        List l = new ArrayList();
        l.add(u.getEmail());
        l.add(u.getPassword());
        return (String) sqlMap.queryForObject("loginUser", l);
    }

    public static void join(ParticipantForm p)
            throws SQLException, ClassNotFoundException, IOException {

        sqlMap.insert("join", p);
    }

    public static void unsubscribe(ParticipantForm p)
            throws SQLException, ClassNotFoundException, IOException {


        sqlMap.delete("unsubscribe", p);
    }

    public static String getParticipant(String email, String name)
            throws SQLException, ClassNotFoundException, IOException {
        List l = new ArrayList();
        l.add(email);
        l.add(name);


        return (String) sqlMap.queryForObject("getParticipant", l);
    }

    public static List getParticipants(String name)
            throws SQLException, ClassNotFoundException, IOException {

        return (List) sqlMap.queryForList("getParticipants", name);
    }

     public static List getRoutesForUser(String email)
            throws SQLException, ClassNotFoundException, IOException {

        return (List) sqlMap.queryForList("getRoutesForUser", email);
    }

    public static RegistrationForm getUser(String s)
            throws SQLException, ClassNotFoundException, IOException {

        return (RegistrationForm) sqlMap.queryForObject("getUser", s);
    }

    public static void deleteUser(String s)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.delete("deleteParticipation", s);
        sqlMap.delete("deleteUser", s);
    }

    public static void updateUser(EditUserForm u)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.update("updateUser", u);
    }

    // ---------------------------------------------------------------------------
    public static void createRoute(InsertRouteForm u)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.insert("insertRoute", u);
    }

    public static List<InsertRouteForm> getRoutes()
            throws SQLException, ClassNotFoundException, IOException {
        return (List) sqlMap.queryForList("getRoutes");
    }

    public static InsertRouteForm getRoute(String s)
            throws SQLException, ClassNotFoundException, IOException {
        return (InsertRouteForm) sqlMap.queryForObject("getRoute", s);
    }

    public static void deleteRoute(String s)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.delete("deleteParticipation", s);
        sqlMap.delete("deleteRoute", s);
    }

    public static void updateRoute(EditRouteForm u)
            throws SQLException, ClassNotFoundException, IOException {
        sqlMap.update("updateRoute", u);
    }
}

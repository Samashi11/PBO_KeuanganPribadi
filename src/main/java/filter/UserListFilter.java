/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import model.User;

/**
 *
 * @author user
 */

public class UserListFilter implements Filter {

    private UserDAO userDAO;

    @Override
    public void init(FilterConfig filterConfig) {
        
            userDAO = new UserDAO();
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        if (session != null) {
            User currentUser = (User) session.getAttribute("user");

            if (currentUser != null) {
                List<User> userList = userDAO.findAllUserOnly();
                req.setAttribute("userList", userList);

                System.out.println("DEBUG USER LIST SIZE = " + userList.size());
                for (User u : userList) {
                    System.out.println("USER: " + u.getIdUser() + " | " + u.getUsername());
                }
            }

        }

        chain.doFilter(request, response);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dao.TransaksiDAO;
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
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import model.User;

/**
 *
 * @author user
 */
@WebFilter("/*")
public class HeaderDataFilter implements Filter {

    private TransaksiDAO transaksiDAO;

    @Override
    public void init(FilterConfig filterConfig) {
        transaksiDAO = new TransaksiDAO();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        if (session != null) {
            User user = (User) session.getAttribute("user");

            if (user != null) {
                BigDecimal saldo
                        = transaksiDAO.getSaldoByUserId(user.getIdUser());

                req.setAttribute("headerSaldo", saldo);
            }
        }

        chain.doFilter(request, response);
    }
}

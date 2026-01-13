package filter;

import dao.AnggaranDAO;
import model.Anggaran;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.List;

@WebFilter("/*")
public class SidebarFilter implements Filter {

    private AnggaranDAO anggaranDAO;

    @Override
    public void init(FilterConfig filterConfig) {
        anggaranDAO = new AnggaranDAO();
    }

    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        String path = req.getRequestURI();

        // Skip resource statis
        if (path.contains("/css/")
                || path.contains("/js/")
                || path.contains("/images/")
                || path.endsWith(".css")
                || path.endsWith(".js")) {
            chain.doFilter(request, response);
            return;
        }

        // Ambil data anggaran
        List<Anggaran> anggaranList = anggaranDAO.findAll();

        System.out.println("FILTER SIDEBAR JALAN, DATA: " + anggaranList.size());

        // SET YANG BENAR
        request.setAttribute("listAnggaran", anggaranList);

        chain.doFilter(request, response);
    }
}

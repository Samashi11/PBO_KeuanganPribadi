package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AboutController", urlPatterns = {"/about"})
public class AboutController extends BaseController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // 1. PENTING: Ganti "halaman" menjadi "contentPage" 
        // (Harus sama persis dengan variabel di main.jsp kamu)
        req.setAttribute("contentPage", "/pages/about.jsp");
        
        // Opsional: Untuk menandai menu aktif di sidebar (kalau ada logic-nya)
        req.setAttribute("activePage", "about"); 
        
        // 2. SOLUSI UTAMA (Bypass render):
        // Jangan pakai render(req, resp, "index.jsp");
        // Pakai cara manual ini biar path-nya benar:
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
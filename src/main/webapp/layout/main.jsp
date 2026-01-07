<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. Ambil data dari Controller
    String contentPage = (String) request.getAttribute("contentPage");

    // 2. LOGIC PENGAMAN:
    // Jika contentPage kosong (null), kita paksa arahkan ke Dashboard.
    if (contentPage == null || contentPage.isEmpty()) {
        contentPage = "/pages/dashboard.jsp";
    }
%>

<main class="w-full flex-1 p-4">
   
    <jsp:include page="<%= contentPage %>" />
    
</main>
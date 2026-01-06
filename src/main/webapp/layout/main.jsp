<%
//tangkap request dari url
    String hal = request.getParameter("halaman");
    String url = hal + ".jsp";
    if (hal != null) {
//diarahkan sesuai request,jika ada request di url
%>
<jsp:include page="${contentPage}" />
<%
} else { // tidak ada request di url, diarahkan ke hal home
%>
<%@include file="../pages/dashboard.jsp" %>
<%
    }
%> 
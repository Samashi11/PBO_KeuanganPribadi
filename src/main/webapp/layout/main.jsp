<%
    String contentPage = (String) request.getAttribute("contentPage");
    if (contentPage != null) {
%>
    <jsp:include page="<%= contentPage %>" />
<%
    } else {
%>
    <%@ include file="../pages/dashboard.jsp" %>
<%
    }
%>

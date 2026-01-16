<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header
    class="w-full bg-gradient-to-r from-primary to-indigo-600 dark:from-blue-700 dark:to-indigo-800 rounded-2xl shadow-lg p-6 sm:p-10 relative overflow-hidden"
    >
    <div
        class="absolute top-0 right-0 -mt-10 -mr-10 w-64 h-64 bg-white opacity-10 rounded-full blur-3xl pointer-events-none"
        ></div>
    <div
        class="absolute bottom-0 left-0 -mb-10 -ml-10 w-40 h-40 bg-indigo-300 opacity-20 rounded-full blur-2xl pointer-events-none"
        ></div>
    <div
        class="relative z-10 flex flex-col md:flex-row justify-between items-start md:items-center gap-4"
        >
        <div>
            <%--<c:if test="${not empty sessionScope.user}">--%>
            <h1 class="text-3xl md:text-4xl font-bold text-white mb-2">
                Selamat Datang, ${sessionScope.user.username}
            </h1>
            <%--</c:if>--%>

            <p class="text-blue-100 text-lg">
                Ayo Catat Transaksi Keuangan agar tidak boros.
            </p>
        </div>
        <div class="flex items-center gap-4">
            <div
                class="bg-white/20 backdrop-blur-md rounded-xl p-4 text-white border border-white/10"
                >
                <span class="text-sm text-blue-100 block">Total Saldo</span>
                <span class="text-2xl font-bold">Rp <fmt:formatNumber value="${headerSaldo}" pattern="#,###" /></span>
            </div>
        </div>
    </div>
</header>
<%
    String active = (String) request.getAttribute("activePage");
%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav
    class="w-full bg-surface-light dark:bg-surface-dark rounded-xl shadow-soft border border-gray-100 dark:border-gray-700 p-2 flex flex-wrap items-center justify-between sticky top-4 z-50"
    >
    <div
        class="flex items-center gap-2 overflow-x-auto no-scrollbar px-2 py-1 md:py-0 w-full md:w-auto"
        >

        <!-- Dashboard -->
        <a
            href="${pageContext.request.contextPath}/dashboard"
            class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
            <%= "dashboard".equals(active)
                    ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                    : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>"
            >
            Dashboard
        </a>

        <!-- Transactions -->
        <a
            href="${pageContext.request.contextPath}/transaksi"
            class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
            <%= "transaksi".equals(active)
                    ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                    : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>"
            >
            Transactions
        </a>

        <!-- Reports / Riwayat -->
        <a
            href="${pageContext.request.contextPath}/riwayat"
            class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
            <%= "reports".equals(active)
                    ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                    : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>"
            >
            Reports
        </a>

        <a
            href="${pageContext.request.contextPath}/anggaran"
            class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
            <%= "anggaran".equals(active)
                    ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                    : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>"
            >

            <!--<span class="material-icons-round text-lg">account_balance_wallet</span>-->
            <span>Anggaran</span>
        </a>

        <c:if test="${sessionScope.user.role.namaRole == 'ADMIN'}">
            <a href="${pageContext.request.contextPath}/admin/users"
               class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
               <%= "users".equals(active)
                       ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                       : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>">
                
                Users
            </a>
        </c:if>



        <!-- About -->
        <a
            href="${pageContext.request.contextPath}/about"
            class="px-4 py-2 font-medium rounded-lg whitespace-nowrap transition-colors
            <%= "about".equals(active)
                    ? "bg-primary/10 text-primary dark:bg-primary/20 dark:text-blue-300"
                    : "text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800"%>"
            >
            About
        </a>

    </div>

    <!-- Right Section (tidak disentuh) -->
    <div class="hidden md:flex items-center gap-3 px-2">
        <div class="relative">
            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <span class="material-icons-round text-gray-400 text-sm">search</span>
            </span>
            <input
                class="pl-9 pr-4 py-2 text-sm bg-gray-50 dark:bg-gray-800 border-none rounded-lg focus:ring-2 focus:ring-primary w-48 transition-all"
                placeholder="Search..."
                type="text"
                />
        </div>

        <button
            class="p-2 text-muted-light dark:text-muted-dark hover:bg-gray-100 dark:hover:bg-gray-800 rounded-full transition-colors relative"
            >
            <span class="material-icons-round">notifications</span>
            <span class="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full"></span>
        </button>

        <!-- Kanan: User Menu -->
        <div class="relative group">
            <!-- User Avatar/Button -->
            <button class="flex items-center space-x-3 px-4 py-2 bg-gray-50 dark:bg-gray-800 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-xl transition-all">
                <div class="w-10 h-10 rounded-full bg-gradient-to-r from-primary to-blue-400 flex items-center justify-center text-white font-bold">
                    ${sessionScope.user.namaLengkap.charAt(0)}
                </div>
                <div class="text-left">
                    <p class="font-medium text-text-light dark:text-text-dark">${sessionScope.user.namaLengkap}</p>
                    <p class="text-xs text-muted-light dark:text-muted-dark">${sessionScope.user.role.namaRole}</p>
                </div>
                <span class="material-icons-round text-muted-light dark:text-muted-dark">expand_more</span>
            </button>

            <!-- Dropdown Menu -->
            <div class="absolute right-0 mt-2 w-56 bg-white dark:bg-gray-800 rounded-xl shadow-card border border-gray-100 dark:border-gray-700 py-2 hidden group-hover:block z-50">
                <div class="px-4 py-3 border-b border-gray-100 dark:border-gray-700">
                    <p class="font-medium text-text-light dark:text-text-dark">${sessionScope.user.namaLengkap}</p>
                    <p class="text-sm text-muted-light dark:text-muted-dark">${sessionScope.user.email}</p>
                </div>

                <a href="${pageContext.request.contextPath}/profile" 
                   class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                    <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">person</span>
                    <span>Profil Saya</span>
                </a>

                <!-- MENU GANTI PASSWORD -->
                <a href="${pageContext.request.contextPath}/change-password" 
                   class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                    <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">lock_reset</span>
                    <span>Ganti Password</span>
                </a>

                <a href="${pageContext.request.contextPath}/settings" 
                   class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                    <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">settings</span>
                    <span>Pengaturan</span>
                </a>

                <div class="border-t border-gray-100 dark:border-gray-700 my-2"></div>

                <a href="${pageContext.request.contextPath}/logout" 
                   class="flex items-center px-4 py-3 text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-colors">
                    <span class="material-icons-round mr-3">logout</span>
                    <span>Keluar</span>
                </a>
            </div>
        </div>
    </div>
</nav>

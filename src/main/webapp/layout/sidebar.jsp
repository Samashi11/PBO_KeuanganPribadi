<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="model.Anggaran" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<aside class="lg:col-span-1 xl:col-span-1 space-y-6">    

    <div
        class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl shadow-soft border border-gray-100 dark:border-gray-700"
        >
        <div class="flex justify-between items-center mb-4">
            <h2
                class="text-lg font-semibold text-text-light dark:text-text-dark"
                >
                Anggaran

            </h2>
            <!-- tombol edit kecil -->
            <c:if test="${sessionScope.user.role.namaRole == 'USER'}">
                <a
                    href="${pageContext.request.contextPath}/anggaran"
                    class="text-gray-400 hover:text-primary transition"
                    title="Edit Anggaran"
                    >
                    <span class="material-icons-round text-sm">edit</span>
                </a>
            </c:if>
        </div>

        <%
            List<Anggaran> anggaranList
                    = (List<Anggaran>) request.getAttribute("listAnggaran");
        %>

        <div class="space-y-6">
            <%                if (anggaranList != null && !anggaranList.isEmpty()) {
            %>
<!--            <div class="text-sm text-muted-light dark:text-muted-dark">
                Buat Anggaran Anda terlebih dahulu
            </div>-->
            <%
                for (Anggaran a : anggaranList) {

                    BigDecimal total = a.getJumlahAnggaran();
                    BigDecimal sisa = a.getSisaAnggaran();

                    if (total == null || total.compareTo(BigDecimal.ZERO) == 0) {
            %>          
            <div class="bg-surface-light dark:bg-surface-dark p-3 rounded-xl shadow-soft">
                <div class="flex justify-between items-center text-sm mb-2">
                    <span class="font-medium">
                        <%= a.getKategori().getNamaKategori()%>
                    </span>
                    <span class="text-xs text-muted-light dark:text-muted-dark">
                        Rp  / Rp <%= total%>
                    </span>
                </div>

                <div class="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2 overflow-hidden">
                    <div class="bg-primary h-2 rounded-full transition-all duration-300"
                         style="">
                    </div>
                </div>

                <div class="mt-1 text-xs text-muted-light dark:text-muted-dark text-right">
                    % terpakai
                </div>
            </div>
            <!--DEBUG TOTAL: <%= total%> | SISA: <%= sisa%><br>-->
            <%
                    continue; // skip data rusak
                }

                BigDecimal terpakai = total.subtract(sisa);

                int persen = terpakai
                        .multiply(new BigDecimal(100))
                        .divide(total, 0, RoundingMode.HALF_UP)
                        .intValue();
            %>

            <div class="bg-surface-light dark:bg-surface-dark p-3 rounded-xl shadow-soft">
                <div class="flex justify-between items-center text-sm mb-2">
                    <span class="font-medium">
                        <%= a.getKategori().getNamaKategori()%>
                    </span>
                    <span class="text-xs text-muted-light dark:text-muted-dark">
                        Rp <%= terpakai%> / Rp <%= total%>
                    </span>
                </div>

                <div class="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2 overflow-hidden">
                    <div class="bg-primary h-2 rounded-full transition-all duration-300"
                         style="width: <%= Math.min(persen, 100)%>%">
                    </div>
                </div>

                <div class="mt-1 text-xs text-muted-light dark:text-muted-dark text-right">
                    <%= persen%>% terpakai
                </div>
            </div>

            <%
                }
            } else {
            %>

            <div class="text-sm text-muted-light dark:text-muted-dark">
                Belum ada data anggaran
            </div>

            <%
                }
            %>
        </div>
    </div>
    <div
        class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl shadow-soft border border-gray-100 dark:border-gray-700"
        >
        <h2
            class="text-lg font-semibold text-text-light dark:text-text-dark mb-4"
            >
            Pengguna FinDash
        </h2>
        <div class="flex gap-2 overflow-x-auto pb-2 mb-4 no-scrollbar">
            <div
                class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer"
                >
                <div
                    class="w-12 h-12 rounded-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center hover:bg-gray-300 dark:hover:bg-gray-600 transition-colors"
                    >
                    <span
                        class="material-icons-round text-muted-light dark:text-muted-dark"
                        >add</span
                    >
                </div>
                <span class="text-xs text-muted-light dark:text-muted-dark"
                      >New</span
                >
            </div>
            <c:forEach items="${userList}" var="u">
                <div
                    class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer group user-item"
                    data-user-id="${u.idUser}"
                    data-username="${u.username}"
                    >
                    <div
                        class="w-12 h-12 rounded-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center border-2 border-transparent group-hover:border-primary transition-all"
                        >
                        <span class="text-sm font-semibold text-text-light dark:text-text-dark">
                            ${fn:substring(u.username, 0, 1)}
                        </span>
                    </div>

                    <span
                        class="text-xs text-text-light dark:text-text-dark font-medium"
                        >
                        ${u.username}
                    </span>
                </div>
            </c:forEach>

        </div>
        <div class="relative">
            <span
                class="absolute left-3 top-2.5 text-muted-light dark:text-muted-dark"
                >$</span
            >
            <input
                class="w-full pl-7 pr-12 py-2 bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-sm focus:ring-primary focus:border-primary"
                placeholder="0.00"
                type="number"
                />
            <button
                class="absolute right-1 top-1 bg-primary hover:bg-primary-dark text-white px-3 py-1.5 rounded-md text-xs font-medium transition-colors"
                >
                Send
            </button>
        </div>
    </div>
</aside>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<main class="flex-grow bg-surface-light dark:bg-surface-dark rounded-xl shadow-sm p-6">

    <div class="flex justify-between items-center mb-6">
        <h2 class="text-xl font-bold text-gray-900 dark:text-white flex items-center gap-2">
            <span class="material-icons-round text-primary">history</span>
            Recent Transactions
        </h2>
        <div class="flex gap-2">
            <button class="text-sm flex items-center gap-1 text-gray-500 dark:text-gray-400 hover:text-primary transition">
                <span class="material-icons-round text-base">file_download</span>
                Export
            </button>
        </div>
    </div>

    <div class="relative w-full mb-6">
        <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <span class="material-icons-round text-gray-400">search</span>
        </span>
        <input class="pl-10 block w-full rounded-lg border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50"
               placeholder="Search transactions..." type="text" />
    </div>

    <div class="overflow-x-auto">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="text-xs text-gray-400 border-b border-gray-100 dark:border-gray-700">
                        <th class="py-4 font-medium uppercase tracking-wider">Date</th>
                        <th class="py-4 font-medium uppercase tracking-wider">Description</th>
                        <th class="py-4 font-medium uppercase tracking-wider">Category</th>
                        <th class="py-4 font-medium uppercase tracking-wider text-right">Amount</th>
                        <th class="py-4 font-medium uppercase tracking-wider text-center">Status</th>
                        <th class="py-4 font-medium uppercase tracking-wider text-center">Aksi</th>
                    </tr>
                </thead>

                <tbody class="text-sm">
                    <c:forEach var="t" items="${transaksiList}">
                        <tr class="group hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors border-b border-gray-50 dark:border-gray-800 last:border-none">

                            <td class="py-4 text-gray-500">
                                <fmt:formatDate value="${t.tanggal}" pattern="dd MMM yyyy" />
                            </td>

                            <td class="py-4">
                                <div class="flex items-center gap-3">
                                    <c:set var="iconName" value="shopping_bag" />
                                    <c:set var="iconColor" value="bg-purple-100 text-purple-600" />

                                    <c:choose>
                                        <c:when test="${t.kategori.namaKategori == 'Makan'}">
                                            <c:set var="iconName" value="restaurant" />
                                            <c:set var="iconColor" value="bg-orange-100 text-orange-600" />
                                        </c:when>
                                        <c:when test="${t.kategori.namaKategori == 'Transport'}">
                                            <c:set var="iconName" value="directions_car" />
                                            <c:set var="iconColor" value="bg-blue-100 text-blue-600" />
                                        </c:when>
                                        <c:when test="${t.kategori.namaKategori == 'Hiburan'}">
                                            <c:set var="iconName" value="movie" />
                                            <c:set var="iconColor" value="bg-pink-100 text-pink-600" />
                                        </c:when>
                                        <c:when test="${t.kategori.namaKategori == 'Gaji'}">
                                            <c:set var="iconName" value="attach_money" />
                                            <c:set var="iconColor" value="bg-green-100 text-green-600" />
                                        </c:when>
                                    </c:choose>

                                    <div class="w-10 h-10 rounded-full ${iconColor} flex items-center justify-center">
                                        <span class="material-icons-round text-lg">${iconName}</span>
                                    </div>

                                    <span class="font-medium text-gray-700 dark:text-gray-200">
                                        ${t.keterangan}
                                    </span>
                                </div>
                            </td>

                            <td class="py-4 text-gray-500">
                                ${t.kategori.namaKategori}
                            </td>

                            <td class="py-4 text-right font-medium text-red-500">
                                - Rp <fmt:formatNumber value="${t.jumlah}" pattern="#,###" />
                            </td>

                            <td class="py-4 text-center">
                                <span class="px-2 py-1 rounded text-xs font-medium bg-green-100 text-green-600">
                                    Completed
                                </span>
                            </td>

                            <td class="py-4 text-center">
                                <a href="${pageContext.request.contextPath}/transaksi?action=edit&id=${t.id}" 
                                   class="inline-flex items-center justify-center w-8 h-8 rounded-full hover:bg-blue-100 text-gray-400 hover:text-blue-500 transition-colors mr-1"
                                   title="Edit">
                                    <span class="material-icons-round text-lg">edit</span>
                                </a>

                               
                                <a href="${pageContext.request.contextPath}/transaksi?action=delete&id=${t.id}" 
                                   onclick="return confirm('Yakin mau hapus data ini?')"
                                   class="inline-flex items-center justify-center w-8 h-8 rounded-full hover:bg-red-100 text-gray-400 hover:text-red-500 transition-colors"
                                   title="Hapus">
                                    <span class="material-icons-round text-lg">delete</span>
                                </a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="flex items-center justify-between mt-6 pt-4 border-t border-gray-100 dark:border-gray-700">
        <p class="text-sm text-gray-500 dark:text-gray-400">
            Showing all data
        </p>
    </div>
</main>
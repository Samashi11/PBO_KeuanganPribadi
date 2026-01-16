<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="flex-grow bg-surface-light dark:bg-surface-dark rounded-xl shadow-sm p-6">
    <div class="p-6 sm:p-8">

        <div class="flex items-center justify-between mb-6">
            <h2 class="text-xl font-bold text-gray-900 dark:text-white flex items-center gap-2">
                <span class="material-icons-round text-primary">account_balance_wallet</span>
                Budget Settings
            </h2>
        </div>

        <!-- LIST ANGGARAN -->
        <div class="space-y-4">

            <c:forEach items="${anggaranList}" var="a">

                <form
                    class="grid grid-cols-1 md:grid-cols-3 gap-4 items-end bg-white dark:bg-gray-800 p-4 rounded-xl border border-gray-100 dark:border-gray-700"
                    action="${pageContext.request.contextPath}/anggaran"
                    method="POST"
                    >
                    <!-- hidden id -->
                    <input type="hidden" name="id_anggaran" value="${a.idAnggaran}">

                    <!-- KATEGORI (READ ONLY) -->
                    <div class="col-span-1">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Category
                        </label>
                        <input
                            class="block w-full rounded-xl border-gray-300 dark:border-gray-600 bg-gray-100 dark:bg-gray-700 sm:text-sm dark:text-white"
                            type="text"
                            value="${a.kategori.namaKategori}"
                            readonly
                            />
                    </div>

                    <!-- JUMLAH ANGGARAN -->
                    <div class="col-span-1">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Budget Amount
                        </label>
                        <div class="relative rounded-md shadow-sm">
                            <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
                                <span class="text-gray-500 sm:text-lg">Rp</span>
                            </div>
                            <input
                                class="block w-full rounded-xl border-gray-300 dark:border-gray-600 pl-10 pr-4 pt-3 pb-3 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-lg dark:text-white placeholder-gray-400"
                                name="jumlah"
                                type="number"
                                step="0.01"
                                required
                                value="${a.jumlahAnggaran}"
                                />
                        </div>
                    </div>

                    <!-- SUBMIT -->
                    <div class="col-span-1 flex justify-end">
                        <button
                            class="px-5 py-2.5 text-sm font-medium text-white bg-primary hover:bg-primary-hover rounded-xl shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-all flex items-center gap-2"
                            type="submit"
                            >
                            <span class="material-icons-round text-base">save</span>
                            Save
                        </button>
                    </div>

                </form>

            </c:forEach>

        </div>
    </div>
</main>

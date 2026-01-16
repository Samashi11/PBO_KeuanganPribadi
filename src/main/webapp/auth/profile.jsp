<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>

<main class="lg:col-span-2 xl:col-span-3 space-y-6">

    <form method="post" action="${pageContext.request.contextPath}/profile">

        <div class="bg-surface-light dark:bg-surface-dark rounded-xl shadow-soft border border-gray-100 dark:border-gray-700 overflow-hidden">

            <div class="h-32 bg-gradient-to-r from-blue-100 to-indigo-100 dark:from-blue-900/20 dark:to-indigo-900/20"></div>

            <div class="px-6 pb-8">

                <!-- HEADER -->
                <div class="relative flex justify-between items-end -mt-12 mb-8">
                    <div class="relative">
                        <div class="w-24 h-24 rounded-2xl bg-gradient-to-tr from-purple-500 to-pink-500 border-4 border-surface-light dark:border-surface-dark shadow-md"></div>
                    </div>

                    <div class="flex gap-3">
                        <button type="submit"
                                class="px-4 py-2 bg-primary text-white text-sm font-semibold rounded-lg hover:bg-primary-dark transition-colors shadow-sm">
                            Save Changes
                        </button>
                        <button type="button"
                                onclick="window.history.back()"
                                class="px-4 py-2 bg-gray-100 dark:bg-gray-800 text-muted-light dark:text-muted-dark text-sm font-semibold rounded-lg hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors">
                            Cancel
                        </button>
                    </div>
                </div>

                <!-- FORM -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

                    <!-- FULL NAME -->
                    <div class="space-y-2">
                        <label class="text-sm font-medium text-muted-light dark:text-muted-dark flex items-center gap-2">
                            <span class="material-icons-round text-lg">person</span>
                            Full Name
                        </label>
                        <input
                            name="nama"
                            class="w-full px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border-none rounded-xl focus:ring-2 focus:ring-primary text-text-light dark:text-text-dark font-medium transition-all"
                            type="text"
                            value="${sessionScope.user.namaLengkap}"
                            required />
                    </div>

                    <!-- USERNAME (READ ONLY) -->
                    <div class="space-y-2">
                        <label class="text-sm font-medium text-muted-light dark:text-muted-dark flex items-center gap-2">
                            <span class="material-icons-round text-lg">
                                alternate_email
                            </span>
                            Username
                        </label>
                        <input
                            class="w-full px-4 py-2.5 bg-gray-100 dark:bg-gray-700 border-none rounded-xl text-text-light dark:text-text-dark font-medium"
                            type="text"
                            value="${sessionScope.user.username}"
                            disabled />
                    </div>

                    <!-- EMAIL -->
                    <div class="space-y-2">
                        <label class="text-sm font-medium text-muted-light dark:text-muted-dark flex items-center gap-2">
                            <span class="material-icons-round text-lg">mail</span>
                            Email Address
                        </label>
                        <input
                            name="email"
                            class="w-full px-4 py-2.5 bg-gray-50 dark:bg-gray-800 border-none rounded-xl focus:ring-2 focus:ring-primary text-text-light dark:text-text-dark font-medium transition-all"
                            type="email"
                            value="${sessionScope.user.email}"
                            required />
                    </div>

                    <!-- ROLE (READ ONLY) -->
                    <div class="space-y-2">
                        <label class="text-sm font-medium text-muted-light dark:text-muted-dark flex items-center gap-2">
                            <span class="material-icons-round text-lg">verified_user</span>
                            Account Role
                        </label>
                        <input
                            class="w-full px-4 py-2.5 bg-gray-100 dark:bg-gray-700 border-none rounded-xl text-text-light dark:text-text-dark font-medium"
                            type="text"
                            value="${sessionScope.user.role.namaRole}"
                            disabled />
                    </div>

                </div>

                <!-- SECURITY -->
                <div class="mt-12 pt-8 border-t border-gray-100 dark:border-gray-700">
                    <h3 class="text-lg font-semibold mb-6">Security & Preferences</h3>

                    <a href="${pageContext.request.contextPath}/change-password"
                       class="p-4 bg-gray-50 dark:bg-gray-800/50 rounded-xl flex items-center justify-between border border-transparent hover:border-primary/20 transition-all cursor-pointer group">

                        <div class="flex items-center gap-4">
                            <div class="p-3 bg-blue-100 dark:bg-blue-900/30 text-primary rounded-lg">
                                <span class="material-icons-round">lock</span>
                            </div>
                            <div>
                                <p class="font-medium">Password</p>
                                <p class="text-xs text-muted-light dark:text-muted-dark">Change your password</p>
                            </div>
                        </div>

                        <span class="material-icons-round text-muted-light group-hover:text-primary">chevron_right</span>
                    </a>
                </div>

            </div>
        </div>

    </form>
</main>

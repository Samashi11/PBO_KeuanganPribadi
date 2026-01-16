<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<main class="flex-grow bg-surface-light dark:bg-surface-dark rounded-xl shadow-sm p-6">

    <div class="flex justify-between items-center mb-6">
        <h2 class="text-xl font-bold text-gray-900 dark:text-white flex items-center gap-2">
            <span class="material-icons-round text-primary">group</span>
            User Management
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
                    <tr class="text-xs text-gray-400 border-b">
                        <th class="py-4">Username</th>
                        <th class="py-4">Nama Lengkap</th>
                        <th class="py-4">Email</th>
                        <th class="py-4 text-center">Role</th>
                        <th class="py-4 text-center">Aksi</th>
                    </tr>
                </thead>

                <tbody class="text-sm">
                    <c:forEach items="${users}" var="u">
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-800 border-b">

                            <td class="py-4 font-medium">
                                ${u.username}
                            </td>

                            <td class="py-4 text-gray-500">
                                ${u.namaLengkap}
                            </td>

                            <td class="py-4 text-gray-500">
                                ${u.email}
                            </td>

                            <td class="py-4 text-center">
                                <span class="px-2 py-1 rounded text-xs font-medium
                                      ${u.role.namaRole == 'ADMIN' ? 'bg-purple-100 text-purple-600' : 'bg-blue-100 text-blue-600'}">
                                    ${u.role.namaRole}
                                </span>
                            </td>

                            <td class="py-4 text-center">
                                <a href="${pageContext.request.contextPath}/admin/users?action=edit&id=${u.idUser}"
                                   class="w-8 h-8 inline-flex items-center justify-center rounded-full hover:bg-blue-100">
                                    <span class="material-icons-round text-lg">edit</span>
                                </a>

                                <a href="${pageContext.request.contextPath}/admin/users?action=delete&id=${u.idUser}"
                                   onclick="return confirm('Yakin hapus user ini?')"
                                   class="w-8 h-8 inline-flex items-center justify-center rounded-full hover:bg-red-100">
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
            Showing
        </p>
    </div>
</main>


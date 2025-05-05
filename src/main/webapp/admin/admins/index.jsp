<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RentSphere | Manage Admins</title>
    <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/favicon.png" type="image/png" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-slate-900 text-gray-100 min-h-screen flex">

    <!-- Sidebar -->
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">

        <!-- Topbar -->
        <%@ include file="../partials/header.jsp" %>

        <!-- Table Container -->
        <main class="flex-1 p-6 overflow-hidden">
            <div class="bg-slate-800 border border-slate-700 rounded-2xl shadow-xl h-full overflow-hidden flex flex-col">
                <div class="flex justify-between items-center px-6 py-4 border-b border-slate-700">
                    <h3 class="text-lg font-semibold text-blue-400"><i class="fas fa-users-cog mr-2"></i>All Admins</h3>
                    <a href="${pageContext.request.contextPath}/admin/admin?action=create"
                       class="inline-flex items-center px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white text-sm font-semibold rounded-lg shadow transition">
                        <i class="fas fa-plus mr-2"></i> Add Admin
                    </a>
                </div>
                <div class="overflow-auto flex-1">
                    <table class="min-w-full table-auto divide-y divide-slate-700 text-sm">
                        <thead class="bg-slate-700 sticky top-0 z-10 text-blue-200">
                            <tr>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">Full Name</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">Email</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">Phone</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">Role</th>
                                <th class="px-6 py-3 text-left font-semibold uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-700">
                            <c:forEach var="admin" items="${admins}">
                                <tr class="hover:bg-slate-700/40 transition">
                                    <td class="px-6 py-4">${admin.adminId}</td>
                                    <td class="px-6 py-4">${admin.fullName}</td>
                                    <td class="px-6 py-4">${admin.email}</td>
                                    <td class="px-6 py-4">${admin.phone}</td>
                                    <td class="px-6 py-4">${admin.role}</td>
                                    <td class="px-6 py-4 space-x-3">
                                        <a href="${pageContext.request.contextPath}/admin/admin?action=edit&id=${admin.adminId}"
                                           class="text-blue-400 hover:text-blue-500" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/admin?action=delete&id=${admin.adminId}"
                                           onclick="return confirm('Are you sure you want to delete this admin?');"
                                           class="text-red-400 hover:text-red-500" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
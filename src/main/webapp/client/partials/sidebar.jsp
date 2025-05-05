<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar -->
<aside class="w-64 bg-slate-800 shadow-lg p-6 rounded-2xl text-gray-100">
    <div class="text-center">
        <img src="https://ui-avatars.com/api/?name=${userFullName}&background=334155&color=fff"
             alt="User Avatar"
             class="w-20 h-20 mx-auto rounded-full mb-3 shadow-md ring-2 ring-slate-700">
        <h2 class="text-xl font-semibold text-teal-400">${userFullName}</h2>
        <p class="text-sm text-slate-400">${sessionScope.userSession.email}</p>
    </div>

    <nav class="mt-8 space-y-2 text-sm">
        <a href="${pageContext.request.contextPath}/my-bookings"
           class="flex items-center px-4 py-2 bg-slate-700 hover:bg-slate-600 text-teal-300 rounded-lg transition shadow">
            <i class="fas fa-ticket-alt mr-3 text-teal-400"></i> My Bookings
        </a>
        <a href="${pageContext.request.contextPath}/profile"
           class="flex items-center px-4 py-2 bg-slate-700 hover:bg-slate-600 text-teal-300 rounded-lg transition shadow">
            <i class="fas fa-user mr-3 text-teal-400"></i> My Profile
        </a>
        <a href="${pageContext.request.contextPath}/settings"
           class="flex items-center px-4 py-2 bg-slate-700 hover:bg-slate-600 text-teal-300 rounded-lg transition shadow">
            <i class="fas fa-cog mr-3 text-teal-400"></i> Settings
        </a>
    </nav>
</aside>
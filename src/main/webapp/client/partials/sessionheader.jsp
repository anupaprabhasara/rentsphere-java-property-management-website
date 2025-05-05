<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="bg-slate-900 text-white">
  <nav class="bg-slate-900 sticky top-0 z-50 shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">

        <!-- Brand -->
        <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold text-teal-400 hover:text-teal-300 transition">
          <i class="fas fa-building-user"></i> <span>RentSphere</span>
        </a>

        <!-- Navigation Links -->
        <div class="hidden md:flex space-x-6 text-gray-300">
          <a href="${pageContext.request.contextPath}/" class="hover:text-teal-400 transition">Home</a>
          <a href="${pageContext.request.contextPath}/properties" class="hover:text-teal-400 transition">Properties</a>
          <a href="${pageContext.request.contextPath}/about" class="hover:text-teal-400 transition">About</a>
          <a href="${pageContext.request.contextPath}/contact" class="hover:text-teal-400 transition">Contact</a>
        </div>

        <!-- User Menu (Only show if logged in) -->
        <c:if test="${not empty sessionScope.user}">
          <div class="flex items-center space-x-4">
            <div class="relative">
              <button onclick="toggleUserMenu()" class="flex items-center space-x-2 hover:text-teal-300 focus:outline-none">
                <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=334155&color=fff"
                     alt="${sessionScope.name}" class="w-8 h-8 rounded-full">
                <span class="hidden sm:block">${sessionScope.name}</span>
                <i class="fas fa-chevron-down text-sm"></i>
              </button>

              <!-- Dropdown -->
              <div id="userDropdown"
                   class="hidden absolute right-0 mt-2 w-52 bg-white text-gray-800 rounded-md shadow-lg border border-gray-200 z-50 overflow-hidden">
                <div class="px-4 py-3 border-b">
                  <p class="text-xs text-gray-500">Signed in as</p>
                  <p class="font-semibold text-sm text-gray-800">${sessionScope.email}</p>
                </div>
                <a href="${pageContext.request.contextPath}/profile" class="flex items-center px-4 py-2 hover:bg-gray-100"><i class="fas fa-user mr-2 text-teal-500"></i>Profile</a>
                <a href="${pageContext.request.contextPath}/my-bookings" class="flex items-center px-4 py-2 hover:bg-gray-100"><i class="fas fa-calendar-check mr-2 text-teal-500"></i>My Bookings</a>
                <a href="${pageContext.request.contextPath}/settings" class="flex items-center px-4 py-2 hover:bg-gray-100"><i class="fas fa-cog mr-2 text-teal-500"></i>Settings</a>
                <div class="border-t">
                  <a href="${pageContext.request.contextPath}/logout" class="flex items-center px-4 py-2 text-red-600 hover:bg-red-50"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
                </div>
              </div>
            </div>
          </div>
        </c:if>

      </div>
    </div>
  </nav>

  <script>
    function toggleUserMenu() {
      const dropdown = document.getElementById('userDropdown');
      dropdown.classList.toggle('hidden');
    }

    document.addEventListener('click', (event) => {
      const userDropdown = document.getElementById('userDropdown');
      if (!event.target.closest('button') && !event.target.closest('#userDropdown')) {
        userDropdown.classList.add('hidden');
      }
    });
  </script>
</header>
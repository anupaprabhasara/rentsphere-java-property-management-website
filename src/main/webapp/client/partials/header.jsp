<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

        <!-- Auth Buttons -->
        <div class="flex items-center space-x-4">
          <a href="${pageContext.request.contextPath}/login" class="flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-teal-600 rounded-lg hover:bg-teal-500 transition">
            <i class="fas fa-sign-in-alt"></i> Login
          </a>
          <a href="${pageContext.request.contextPath}/register" class="flex items-center gap-2 px-4 py-2 text-sm font-medium text-slate-900 bg-white rounded-lg hover:bg-gray-200 transition">
            <i class="fas fa-user-plus"></i> Register
          </a>
        </div>

      </div>
    </div>
  </nav>
</header>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>User Profile | RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-slate-900 text-white font-sans">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Layout -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 flex flex-col lg:flex-row gap-8">

  <!-- Sidebar -->
  <%@ include file="./partials/sidebar.jsp" %>

  <!-- Main Profile Content -->
  <main class="flex-1 bg-slate-800 border border-slate-700 rounded-2xl shadow-lg p-8">
    <h1 class="text-3xl font-bold text-teal-400 mb-8">
      Welcome, <c:out value="${user.fullName}" />
    </h1>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="bg-slate-700 border border-slate-600 rounded-lg p-5 shadow-md">
        <h3 class="text-sm font-semibold text-slate-300 mb-1">
          <i class="fas fa-user mr-2 text-teal-400"></i> Full Name
        </h3>
        <p class="text-lg text-white font-medium">${user.fullName}</p>
      </div>

      <div class="bg-slate-700 border border-slate-600 rounded-lg p-5 shadow-md">
        <h3 class="text-sm font-semibold text-slate-300 mb-1">
          <i class="fas fa-envelope mr-2 text-teal-400"></i> Email
        </h3>
        <p class="text-lg text-white font-medium">${user.email}</p>
      </div>

      <div class="bg-slate-700 border border-slate-600 rounded-lg p-5 shadow-md">
        <h3 class="text-sm font-semibold text-slate-300 mb-1">
          <i class="fas fa-id-card mr-2 text-teal-400"></i> NIC Number
        </h3>
        <p class="text-lg text-white font-medium">${user.nicNumber}</p>
      </div>

      <div class="bg-slate-700 border border-slate-600 rounded-lg p-5 shadow-md">
        <h3 class="text-sm font-semibold text-slate-300 mb-1">
          <i class="fas fa-phone mr-2 text-teal-400"></i> Phone
        </h3>
        <p class="text-lg text-white font-medium">${user.phone}</p>
      </div>

      <div class="bg-slate-700 border border-slate-600 rounded-lg p-5 shadow-md md:col-span-2">
        <h3 class="text-sm font-semibold text-slate-300 mb-1">
          <i class="fas fa-map-marker-alt mr-2 text-teal-400"></i> Address
        </h3>
        <p class="text-lg text-white font-medium">${user.address}</p>
      </div>
    </div>
  </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>
</body>
</html>
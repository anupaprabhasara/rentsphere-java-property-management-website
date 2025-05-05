<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About Us - RentSphere</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-slate-900 text-gray-100 font-sans">

  <!-- Header -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
      <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
  </c:choose>

  <main>

    <!-- Hero Section -->
    <section class="relative py-20 bg-slate-800">
      <div class="container mx-auto px-6 text-center">
        <h1 class="text-4xl font-bold text-teal-400 mb-4">Our Mission</h1>
        <p class="text-xl text-gray-300 max-w-2xl mx-auto">Empowering tenants and landlords with a seamless and secure property rental experience.</p>
      </div>
    </section>

    <!-- History Section -->
    <section class="py-16 bg-slate-900">
      <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <div>
            <img src="https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg" alt="RentSphere History" class="rounded-lg shadow-lg" />
          </div>
          <div>
            <h2 class="text-3xl font-bold text-white mb-6">Built on Trust and Innovation</h2>
            <p class="text-slate-300 mb-4">Since our founding, RentSphere has focused on solving the pain points of the rental industry with technology, transparency, and tenant-first thinking.</p>
            <p class="text-slate-300">From simple booking to landlord dashboards, our platform evolves to serve the real needs of our users in a fast-moving world.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section class="py-16 bg-slate-800">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Our Core Values</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">

          <!-- Transparency -->
          <div class="bg-slate-700 p-6 rounded-lg shadow">
            <div class="text-4xl text-yellow-400 mb-4"><i class="fas fa-eye"></i></div>
            <h3 class="text-xl font-semibold mb-2 text-white">Transparency</h3>
            <p class="text-slate-300">Clear, honest, and upfront in every interaction</p>
          </div>

          <!-- Empowerment -->
          <div class="bg-slate-700 p-6 rounded-lg shadow">
            <div class="text-4xl text-green-400 mb-4"><i class="fas fa-users-cog"></i></div>
            <h3 class="text-xl font-semibold mb-2 text-white">Empowerment</h3>
            <p class="text-slate-300">Enabling both landlords and tenants to make informed decisions</p>
          </div>

          <!-- Innovation -->
          <div class="bg-slate-700 p-6 rounded-lg shadow">
            <div class="text-4xl text-blue-400 mb-4"><i class="fas fa-lightbulb"></i></div>
            <h3 class="text-xl font-semibold mb-2 text-white">Innovation</h3>
            <p class="text-slate-300">Constantly improving with user-first technology</p>
          </div>

        </div>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
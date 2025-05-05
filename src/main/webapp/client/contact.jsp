<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us - RentSphere</title>
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
        <h1 class="text-4xl font-bold text-teal-400 mb-4">Contact RentSphere</h1>
        <p class="text-xl text-gray-300 max-w-2xl mx-auto">We're here to support you with property inquiries, bookings, and more.</p>
      </div>
    </section>

    <!-- Contact Info Section -->
    <section class="py-16 bg-slate-900">
      <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
          <!-- Location -->
          <div class="bg-slate-800 p-8 rounded-lg shadow">
            <div class="text-4xl text-teal-400 mb-4"><i class="fas fa-map-marker-alt"></i></div>
            <h3 class="text-xl font-semibold text-white mb-2">Address</h3>
            <p class="text-slate-300">
              456 Rental Ave<br>
              Colombo, Sri Lanka
            </p>
          </div>

          <!-- Phone -->
          <div class="bg-slate-800 p-8 rounded-lg shadow">
            <div class="text-4xl text-teal-400 mb-4"><i class="fas fa-phone-alt"></i></div>
            <h3 class="text-xl font-semibold text-white mb-2">Phone</h3>
            <p class="text-slate-300">
              General: +94 77 123 4567<br>
              Support: +94 76 987 6543
            </p>
          </div>

          <!-- Email -->
          <div class="bg-slate-800 p-8 rounded-lg shadow">
            <div class="text-4xl text-teal-400 mb-4"><i class="fas fa-envelope"></i></div>
            <h3 class="text-xl font-semibold text-white mb-2">Email</h3>
            <p class="text-slate-300">
              Help: support@rentsphere.com<br>
              Info: info@rentsphere.com
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Working Hours -->
    <section class="py-16 bg-slate-800">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Office Hours</h2>
        <div class="max-w-2xl mx-auto bg-slate-700 p-8 rounded-lg shadow-lg">
          <div class="space-y-4 text-slate-200">
            <div class="flex justify-between border-b border-slate-600 pb-2">
              <span class="font-medium">Customer Support</span>
              <span>9:00 AM - 6:00 PM (Mon–Fri)</span>
            </div>
            <div class="flex justify-between border-b border-slate-600 pb-2">
              <span class="font-medium">Property Viewing</span>
              <span>10:00 AM - 5:00 PM (Weekdays)</span>
            </div>
            <div class="flex justify-between">
              <span class="font-medium">Email Support</span>
              <span>24/7 Response</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- OpenStreetMap Embed -->
    <section class="py-16 bg-slate-900">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Find Us</h2>
        <div class="rounded-lg overflow-hidden shadow-lg border border-slate-700">
          <iframe
            width="100%"
            height="400"
            src="https://www.openstreetmap.org/export/embed.html?bbox=79.854%2C6.920%2C79.858%2C6.924&layer=mapnik&marker=6.922%2C79.856"
            style="border: none;">
          </iframe>
        </div>
        <div class="mt-6 text-center text-slate-300">
          <a href="https://www.openstreetmap.org/?mlat=6.922&mlon=79.856#map=17/6.922/79.856"
             target="_blank"
             class="text-teal-400 hover:underline">View Larger Map</a>
          <p class="mt-2">Conveniently located in central Colombo near all major transport lines.</p>
        </div>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
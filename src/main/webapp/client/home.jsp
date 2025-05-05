<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>RentSphere | Find Your Perfect Home</title>
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
  <section class="relative h-screen">
    <div class="absolute inset-0">
      <img src="https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg" alt="Hero Image" class="w-full h-full object-cover" />
      <div class="absolute inset-0 bg-black bg-opacity-60"></div>
    </div>
    <div class="relative container mx-auto px-6 h-full flex items-center">
      <div class="text-white max-w-2xl">
        <h1 class="text-5xl font-bold mb-4 text-teal-400">Find Your Perfect Rental</h1>
        <p class="text-xl mb-8 text-gray-200">Smart, secure, and stress-free property rentals with RentSphere.</p>
        <a href="${pageContext.request.contextPath}/properties" class="bg-teal-500 hover:bg-teal-600 text-white px-8 py-3 rounded-lg font-semibold transition">Browse Properties</a>
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section class="py-16 bg-slate-800">
    <div class="container mx-auto px-6">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
        <div>
          <div class="text-4xl text-teal-400 mb-4"><i class="fas fa-home"></i></div>
          <h3 class="text-xl font-semibold mb-2">Verified Listings</h3>
          <p class="text-slate-300">Only trusted and landlord-approved rental properties</p>
        </div>
        <div>
          <div class="text-4xl text-blue-400 mb-4"><i class="fas fa-user-shield"></i></div>
          <h3 class="text-xl font-semibold mb-2">Secure Bookings</h3>
          <p class="text-slate-300">Your data and reservations are safe with us</p>
        </div>
        <div>
          <div class="text-4xl text-yellow-400 mb-4"><i class="fas fa-clock"></i></div>
          <h3 class="text-xl font-semibold mb-2">Fast Processing</h3>
          <p class="text-slate-300">Instant booking and real-time confirmation</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Promotions -->
  <section class="py-16 bg-slate-900">
    <div class="container mx-auto px-6">
      <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Special Offers</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div class="bg-slate-800 rounded-lg shadow-lg overflow-hidden">
          <img src="https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg" class="w-full h-48 object-cover" alt="Offer 1" />
          <div class="p-6">
            <h3 class="text-xl font-semibold text-white mb-2">Zero Deposit Rentals</h3>
            <p class="text-slate-300">Book your next home without a deposit.</p>
          </div>
        </div>
        <div class="bg-slate-800 rounded-lg shadow-lg overflow-hidden">
          <img src="https://images.pexels.com/photos/271743/pexels-photo-271743.jpeg" class="w-full h-48 object-cover" alt="Offer 2" />
          <div class="p-6">
            <h3 class="text-xl font-semibold text-white mb-2">Early Bird Discounts</h3>
            <p class="text-slate-300">Get up to 15% off for early reservations.</p>
          </div>
        </div>
        <div class="bg-slate-800 rounded-lg shadow-lg overflow-hidden">
          <img src="https://images.pexels.com/photos/276554/pexels-photo-276554.jpeg" class="w-full h-48 object-cover" alt="Offer 3" />
          <div class="p-6">
            <h3 class="text-xl font-semibold text-white mb-2">Long-Term Stays</h3>
            <p class="text-slate-300">Exclusive deals for long-term tenants.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials Section -->
  <c:if test="${not empty topReviews}">
    <section class="py-16 bg-slate-800">
      <div class="container mx-auto px-6">
        <h2 class="text-3xl font-bold text-center text-teal-400 mb-12">Tenant Feedback</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <c:forEach var="review" items="${topReviews}">
            <div class="bg-slate-700 p-6 rounded-lg shadow">
              <div class="text-yellow-400 mb-4">
                <c:forEach begin="1" end="${review.rating}">
                  <i class="fas fa-star"></i>
                </c:forEach>
                <c:forEach begin="1" end="${5 - review.rating}">
                  <i class="far fa-star text-yellow-500/50"></i>
                </c:forEach>
              </div>
              <p class="text-slate-300 mb-4">“${review.comment}”</p>
              <p class="font-semibold text-gray-200">– ${review.tenantName}</p>
              <p class="text-sm text-gray-400 mt-1 italic">${review.propertyTitle}</p>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>
  </c:if>

</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

</body>
</html>
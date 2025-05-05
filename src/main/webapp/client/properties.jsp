<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Properties - RentSphere</title>
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

<!-- Main Content -->
<main class="border-b border-slate-700 py-16">
  <div class="container mx-auto px-6">
    <h1 class="text-4xl font-bold text-center text-teal-400 mb-12">Available Properties</h1>

    <c:if test="${empty properties}">
      <p class="text-center text-slate-400">No properties available at the moment.</p>
    </c:if>

    <!-- Property Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <c:forEach var="property" items="${properties}">
        <div class="bg-slate-800 rounded-lg shadow-lg overflow-hidden border border-slate-700">
          <img src="${pageContext.request.contextPath}/assets/properties/${property.propertyId}.jpg" alt="Property Image"
               class="w-full h-64 object-cover">
          <div class="p-6">
            <h3 class="text-2xl font-semibold text-teal-400 mb-2">${property.title}</h3>
            <p class="text-slate-300 mb-2">${property.address}</p>
            <p class="text-slate-400 text-sm mb-4">Owned by: ${property.landlordName} (${property.landlordEmail})</p>
            <div class="flex justify-between items-center mb-4">
              <span class="text-xl font-bold text-white">Rs. ${property.rent}/month</span>
              <a href="${pageContext.request.contextPath}/book-property?id=${property.propertyId}"
                 class="bg-teal-500 text-white px-4 py-2 rounded hover:bg-teal-600 transition book-now-btn"
                 data-status="${property.status}">
                <i class="fas fa-calendar-check mr-1"></i> Book Now
              </a>
            </div>
            <div class="flex flex-wrap gap-2 text-sm">
              <span class="px-3 py-1 bg-slate-700 rounded-full">${property.type}</span>
              <span class="px-3 py-1 bg-slate-700 rounded-full">${property.status}</span>
              <span class="px-3 py-1 bg-slate-700 rounded-full">ID: ${property.propertyId}</span>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

<!-- Booking Validation -->
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const bookButtons = document.querySelectorAll(".book-now-btn");

    bookButtons.forEach(button => {
      button.addEventListener("click", (event) => {
        const status = button.getAttribute("data-status");
        if (status !== "Available") {
          event.preventDefault();
          alert("Booking is not allowed. This property is currently " + status + ".");
        }
      });
    });
  });
</script>

</body>
</html>
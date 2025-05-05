<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="bg-slate-900 text-gray-100 py-12">
    <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <h4 class="text-xl font-bold text-teal-400 mb-4">RentSphere</h4>
                <p class="text-slate-400">Smart. Secure. Simplified Rentals.</p>
            </div>
            <div>
                <h4 class="text-xl font-bold text-teal-400 mb-4">Quick Links</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="${pageContext.request.contextPath}/properties" class="text-slate-400 hover:text-white">Properties</a></li>
                    <li><a href="${pageContext.request.contextPath}/about" class="text-slate-400 hover:text-white">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact" class="text-slate-400 hover:text-white">Contact</a></li>
                </ul>
            </div>
            <div>
                <h4 class="text-xl font-bold text-teal-400 mb-4">Contact</h4>
                <ul class="text-slate-400 space-y-2 text-sm">
                    <li>456 RentHub Avenue</li>
                    <li>Colombo, LK 00100</li>
                    <li>Tel: (+94) 77 123 4567</li>
                    <li>Email: support@rentsphere.com</li>
                </ul>
            </div>
            <div>
                <h4 class="text-xl font-bold text-teal-400 mb-4">Follow Us</h4>
                <div class="flex space-x-4 text-sm">
                    <a href="#" class="text-slate-400 hover:text-white"><i class="fab fa-facebook"></i> Facebook</a>
                    <a href="#" class="text-slate-400 hover:text-white"><i class="fab fa-twitter"></i> Twitter</a>
                    <a href="#" class="text-slate-400 hover:text-white"><i class="fab fa-instagram"></i> Instagram</a>
                </div>
            </div>
        </div>
        <div class="border-t border-slate-700 mt-8 pt-6 text-center text-slate-500 text-sm">
            <p>&copy; 2025 RentSphere. All rights reserved.</p>
        </div>
    </div>
</footer>
<%-- 
    Document   : change-password
    Created on : Jan 16, 2026
    Author     : Your Name
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Ubah Password - FinDash PFM</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet"/>
    <style>
        .password-strength {
            height: 4px;
            margin-top: 4px;
            border-radius: 2px;
        }
        .strength-0 { background-color: #EF4444; width: 25%; }
        .strength-1 { background-color: #F59E0B; width: 50%; }
        .strength-2 { background-color: #3B82F6; width: 75%; }
        .strength-3 { background-color: #10B981; width: 100%; }
    </style>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#3B82F6",
                        "primary-dark": "#2563EB",
                        danger: "#EF4444",
                        success: "#10B981",
                    }
                }
            }
        };
        
        function checkPasswordStrength(password) {
            let strength = 0;
            if (password.length >= 6) strength++;
            if (password.match(/[a-z]+/)) strength++;
            if (password.match(/[A-Z]+/)) strength++;
            if (password.match(/[0-9]+/)) strength++;
            if (password.match(/[$@#&!]+/)) strength++;
            
            return Math.min(strength, 3);
        }
        
        function updatePasswordStrength() {
            const password = document.getElementById('newPassword').value;
            const strength = checkPasswordStrength(password);
            const strengthBar = document.getElementById('passwordStrength');
            
            // Update strength bar
            strengthBar.className = 'password-strength strength-' + strength;
            
            // Update text
            const strengthText = document.getElementById('passwordStrengthText');
            const texts = ['Lemah', 'Sedang', 'Kuat', 'Sangat Kuat'];
            strengthText.textContent = 'Kekuatan: ' + texts[strength];
            strengthText.className = 'text-xs ' + 
                (strength === 0 ? 'text-red-500' : 
                 strength === 1 ? 'text-yellow-500' : 
                 strength === 2 ? 'text-blue-500' : 'text-green-500');
        }
        
        function togglePassword(fieldId, iconId) {
            const field = document.getElementById(fieldId);
            const icon = document.getElementById(iconId);
            
            if (field.type === 'password') {
                field.type = 'text';
                icon.textContent = 'visibility_off';
            } else {
                field.type = 'password';
                icon.textContent = 'visibility';
            }
        }
    </script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 min-h-screen">
    <!-- Navbar -->
    <nav class="bg-white dark:bg-gray-800 shadow-sm">
        <div class="container mx-auto px-4 py-3">
            <div class="flex justify-between items-center">
                <a href="${pageContext.request.contextPath}/dashboard" class="flex items-center space-x-2">
                    <span class="material-icons-round text-primary">account_balance</span>
                    <span class="text-xl font-bold dark:text-white">FinDash PFM</span>
                </a>
                <div class="flex items-center space-x-4">
                    <span class="text-gray-600 dark:text-gray-300">
                        <c:out value="${sessionScope.user.namaLengkap}" default="User" />
                    </span>
                    <a href="${pageContext.request.contextPath}/dashboard" 
                       class="px-4 py-2 bg-primary text-white rounded-lg hover:bg-primary-dark transition">
                        Kembali ke Dashboard
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-md mx-auto">
            <div class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-primary/10 dark:bg-primary/20 rounded-lg flex items-center justify-center text-primary mr-3">
                        <span class="material-icons-round text-2xl">lock_reset</span>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold text-gray-800 dark:text-white">Ubah Password</h1>
                        <p class="text-gray-600 dark:text-gray-300">Lindungi akun Anda dengan password yang aman</p>
                    </div>
                </div>
                
                <!-- Alert Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="mb-6 p-4 bg-green-50 dark:bg-green-900/30 text-green-800 dark:text-green-300 rounded-lg border border-green-200 dark:border-green-800 flex items-start">
                        <span class="material-icons-round text-green-500 mr-2 flex-shrink-0">check_circle</span>
                        <div>
                            <p class="font-medium">Berhasil!</p>
                            <p class="text-sm mt-1">${successMessage}</p>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty errorMessage}">
                    <div class="mb-6 p-4 bg-red-50 dark:bg-red-900/30 text-red-800 dark:text-red-300 rounded-lg border border-red-200 dark:border-red-800 flex items-start">
                        <span class="material-icons-round text-red-500 mr-2 flex-shrink-0">error</span>
                        <div>
                            <p class="font-medium">Gagal!</p>
                            <p class="text-sm mt-1">${errorMessage}</p>
                        </div>
                    </div>
                </c:if>
                
                <!-- Form -->
                <form method="POST" action="${pageContext.request.contextPath}/change-password" class="space-y-6" onsubmit="return validateForm()">
                    <!-- Current Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Password Saat Ini
                        </label>
                        <div class="relative">
                            <input type="password" 
                                   id="currentPassword"
                                   name="currentPassword" 
                                   required
                                   class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary focus:border-transparent pr-10"
                                   placeholder="Masukkan password saat ini">
                            <button type="button" 
                                    onclick="togglePassword('currentPassword', 'currentPasswordIcon')"
                                    class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <span id="currentPasswordIcon" class="material-icons-round text-lg">visibility</span>
                            </button>
                        </div>
                    </div>
                    
                    <!-- New Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Password Baru
                        </label>
                        <div class="relative">
                            <input type="password" 
                                   id="newPassword"
                                   name="newPassword" 
                                   required
                                   minlength="6"
                                   oninput="updatePasswordStrength()"
                                   class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary focus:border-transparent pr-10"
                                   placeholder="Minimal 6 karakter">
                            <button type="button" 
                                    onclick="togglePassword('newPassword', 'newPasswordIcon')"
                                    class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <span id="newPasswordIcon" class="material-icons-round text-lg">visibility</span>
                            </button>
                        </div>
                        <div class="mt-2">
                            <div id="passwordStrength" class="password-strength strength-0"></div>
                            <p id="passwordStrengthText" class="text-xs text-red-500 mt-1">Kekuatan: Lemah</p>
                        </div>
                    </div>
                    
                    <!-- Confirm New Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Konfirmasi Password Baru
                        </label>
                        <div class="relative">
                            <input type="password" 
                                   id="confirmPassword"
                                   name="confirmPassword" 
                                   required
                                   minlength="6"
                                   class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary focus:border-transparent pr-10"
                                   placeholder="Ulangi password baru">
                            <button type="button" 
                                    onclick="togglePassword('confirmPassword', 'confirmPasswordIcon')"
                                    class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <span id="confirmPasswordIcon" class="material-icons-round text-lg">visibility</span>
                            </button>
                        </div>
                        <p id="passwordMatch" class="text-xs text-gray-500 mt-1"></p>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="pt-2">
                        <button type="submit" 
                                class="w-full bg-primary hover:bg-primary-dark text-white font-semibold 
                                       py-3 rounded-lg shadow-md transition duration-300 
                                       flex items-center justify-center">
                            <span class="material-icons-round mr-2">lock_reset</span>
                            Ubah Password
                        </button>
                    </div>
                </form>
                
                <!-- Password Requirements -->
                <div class="mt-8 p-4 bg-gray-50 dark:bg-gray-700 rounded-lg">
                    <h3 class="font-medium text-gray-800 dark:text-white mb-3 flex items-center">
                        <span class="material-icons-round text-primary mr-2">info</span>
                        Tips Password Aman:
                    </h3>
                    <ul class="text-sm text-gray-600 dark:text-gray-300 space-y-2">
                        <li class="flex items-start">
                            <span class="material-icons-round text-green-500 text-sm mr-2 mt-0.5">check_circle</span>
                            Minimal 6 karakter
                        </li>
                        <li class="flex items-start">
                            <span class="material-icons-round text-green-500 text-sm mr-2 mt-0.5">check_circle</span>
                            Kombinasikan huruf besar dan kecil
                        </li>
                        <li class="flex items-start">
                            <span class="material-icons-round text-green-500 text-sm mr-2 mt-0.5">check_circle</span>
                            Tambahkan angka dan simbol
                        </li>
                        <li class="flex items-start">
                            <span class="material-icons-round text-green-500 text-sm mr-2 mt-0.5">check_circle</span>
                            Hindari menggunakan informasi pribadi
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Dark Mode Toggle & Additional JS -->
    <script>
        // Dark mode toggle
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'fixed bottom-4 right-4 p-3 rounded-full bg-white/10 dark:bg-black/20 text-gray-600 dark:text-gray-300 hover:bg-white/20 dark:hover:bg-black/40 backdrop-blur-md border border-gray-200/20 transition-all z-50';
        toggleBtn.innerHTML = '<span class="material-icons-round">dark_mode</span>';
        toggleBtn.onclick = () => {
            document.documentElement.classList.toggle('dark');
            localStorage.theme = document.documentElement.classList.contains('dark') ? 'dark' : 'light';
            toggleBtn.innerHTML = document.documentElement.classList.contains('dark') 
                ? '<span class="material-icons-round">light_mode</span>' 
                : '<span class="material-icons-round">dark_mode</span>';
        };
        document.body.appendChild(toggleBtn);
        
        // Initialize theme
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark');
            toggleBtn.innerHTML = '<span class="material-icons-round">light_mode</span>';
        }
        
        // Real-time password match check
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const newPass = document.getElementById('newPassword').value;
            const confirmPass = this.value;
            const matchText = document.getElementById('passwordMatch');
            
            if (confirmPass.length === 0) {
                matchText.textContent = '';
                matchText.className = 'text-xs text-gray-500 mt-1';
            } else if (newPass === confirmPass) {
                matchText.textContent = '✓ Password cocok';
                matchText.className = 'text-xs text-green-500 mt-1';
            } else {
                matchText.textContent = '✗ Password tidak cocok';
                matchText.className = 'text-xs text-red-500 mt-1';
            }
        });
        
        // Form validation
        function validateForm() {
            const currentPass = document.getElementById('currentPassword').value;
            const newPass = document.getElementById('newPassword').value;
            const confirmPass = document.getElementById('confirmPassword').value;
            
            if (newPass.length < 6) {
                alert('Password baru minimal 6 karakter');
                return false;
            }
            
            if (newPass !== confirmPass) {
                alert('Password baru dan konfirmasi tidak cocok');
                return false;
            }
            
            if (newPass === currentPass) {
                alert('Password baru harus berbeda dengan password lama');
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>
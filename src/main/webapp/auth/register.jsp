<%-- 
    Document   : register
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
    <title>Daftar Akun - FinDash PFM</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet"/>
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
        
        function checkPasswordStrength(password) {
            let strength = 0;
            if (password.length >= 6) strength++;
            if (password.length >= 8) strength++;
            if (password.match(/[a-z]+/)) strength++;
            if (password.match(/[A-Z]+/)) strength++;
            if (password.match(/[0-9]+/)) strength++;
            if (password.match(/[$@#&!]+/)) strength++;
            
            return Math.min(strength, 3);
        }
        
        function updatePasswordStrength() {
            const password = document.getElementById('password').value;
            const strength = checkPasswordStrength(password);
            const strengthBar = document.getElementById('passwordStrength');
            
            strengthBar.className = 'h-2 rounded-full mt-1 ' + 
                (strength === 0 ? 'bg-red-500 w-1/4' : 
                 strength === 1 ? 'bg-yellow-500 w-1/2' : 
                 strength === 2 ? 'bg-blue-500 w-3/4' : 'bg-green-500 w-full');
            
            const strengthText = document.getElementById('passwordStrengthText');
            const texts = ['Lemah', 'Sedang', 'Kuat', 'Sangat Kuat'];
            strengthText.textContent = texts[strength];
            strengthText.className = 'text-xs mt-1 ' + 
                (strength === 0 ? 'text-red-500' : 
                 strength === 1 ? 'text-yellow-500' : 
                 strength === 2 ? 'text-blue-500' : 'text-green-500');
        }
    </script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 min-h-screen flex items-center justify-center p-4">
    <!-- Background Effects -->
    <div class="fixed inset-0 overflow-hidden pointer-events-none">
        <div class="absolute -top-[10%] -left-[10%] w-[50%] h-[50%] bg-blue-400/20 rounded-full blur-[100px] animate-pulse"></div>
        <div class="absolute top-[20%] right-[-10%] w-[40%] h-[40%] bg-indigo-500/20 rounded-full blur-[100px]"></div>
        <div class="absolute -bottom-[10%] left-[20%] w-[30%] h-[30%] bg-purple-400/20 rounded-full blur-[100px]"></div>
    </div>

    <!-- Main Container -->
    <div class="w-full max-w-2xl bg-white dark:bg-gray-800 rounded-2xl shadow-card border border-gray-100 dark:border-gray-700 overflow-hidden relative z-10">
        <div class="md:flex">
            <!-- Left Side - Illustration/Info -->
            <div class="md:w-1/2 bg-gradient-to-br from-primary to-indigo-600 p-8 text-white hidden md:block">
                <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 mb-8">
                    <span class="material-icons-round text-2xl">account_balance</span>
                    <span class="text-xl font-bold">FinDash PFM</span>
                </a>
                
                <div class="mt-12">
                    <h2 class="text-2xl font-bold mb-4">Bergabung dengan FinDash</h2>
                    <p class="text-blue-100 mb-8">Kelola keuangan pribadi Anda dengan mudah dan aman.</p>
                    
                    <div class="space-y-6">
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-white/20 flex items-center justify-center mr-4 flex-shrink-0">
                                <span class="material-icons-round">insights</span>
                            </div>
                            <div>
                                <h3 class="font-bold">Analisis Cerdas</h3>
                                <p class="text-sm text-blue-100">Pantau pengeluaran dan pemasukan dengan grafik interaktif</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-white/20 flex items-center justify-center mr-4 flex-shrink-0">
                                <span class="material-icons-round">security</span>
                            </div>
                            <div>
                                <h3 class="font-bold">Keamanan Data</h3>
                                <p class="text-sm text-blue-100">Data Anda dienkripsi dengan standar keamanan tinggi</p>
                            </div>
                        </div>
                        
                        <div class="flex items-start">
                            <div class="w-10 h-10 rounded-full bg-white/20 flex items-center justify-center mr-4 flex-shrink-0">
                                <span class="material-icons-round">devices</span>
                            </div>
                            <div>
                                <h3 class="font-bold">Akses Multi-Device</h3>
                                <p class="text-sm text-blue-100">Akses dari smartphone, tablet, atau komputer</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="mt-12 text-center">
                    <p class="text-blue-100">Sudah punya akun?</p>
                    <a href="${pageContext.request.contextPath}/auth/login.jsp" 
                       class="inline-block mt-2 px-6 py-2 bg-white/20 hover:bg-white/30 rounded-lg transition">
                        Masuk ke Akun
                    </a>
                </div>
            </div>
            
            <!-- Right Side - Form -->
            <div class="md:w-1/2 p-8 md:p-10">
                <div class="md:hidden mb-6">
                    <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2">
                        <span class="material-icons-round text-primary text-2xl">account_balance</span>
                        <span class="text-xl font-bold dark:text-white">FinDash PFM</span>
                    </a>
                </div>
                
                <div class="text-center mb-8">
                    <h1 class="text-2xl font-bold text-gray-800 dark:text-white">Buat Akun Baru</h1>
                    <p class="text-gray-600 dark:text-gray-300 mt-2">Daftar untuk mulai mengelola keuangan Anda</p>
                </div>
                
                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div class="mb-6 p-4 bg-red-50 dark:bg-red-900/30 text-red-800 dark:text-red-300 rounded-lg border border-red-200 dark:border-red-800 flex items-start">
                        <span class="material-icons-round text-red-500 mr-2 flex-shrink-0">error</span>
                        <div>
                            <p class="font-medium">Registrasi Gagal</p>
                            <p class="text-sm mt-1">${errorMessage}</p>
                        </div>
                    </div>
                </c:if>
                
                <!-- Success Message -->
                <c:if test="${not empty successMessage}">
                    <div class="mb-6 p-4 bg-green-50 dark:bg-green-900/30 text-green-800 dark:text-green-300 rounded-lg border border-green-200 dark:border-green-800 flex items-start">
                        <span class="material-icons-round text-green-500 mr-2 flex-shrink-0">check_circle</span>
                        <div>
                            <p class="font-medium">Registrasi Berhasil!</p>
                            <p class="text-sm mt-1">${successMessage}</p>
                        </div>
                    </div>
                </c:if>
                
                <!-- Registration Form -->
                <form method="POST" action="${pageContext.request.contextPath}/register" class="space-y-5">
                    <!-- Full Name -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5">
                            Nama Lengkap <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                <span class="material-icons-round text-lg">person</span>
                            </span>
                            <input type="text" 
                                   name="namaLengkap" 
                                   value="${param.namaLengkap}"
                                   required
                                   class="w-full pl-10 pr-4 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                   placeholder="Masukkan nama lengkap">
                        </div>
                    </div>
                    
                    <!-- Email -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5">
                            Email <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                <span class="material-icons-round text-lg">email</span>
                            </span>
                            <input type="email" 
                                   name="email" 
                                   value="${param.email}"
                                   required
                                   class="w-full pl-10 pr-4 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                   placeholder="nama@contoh.com">
                        </div>
                    </div>
                    
                    <!-- Username -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5">
                            Username <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                <span class="material-icons-round text-lg">alternate_email</span>
                            </span>
                            <input type="text" 
                                   name="username" 
                                   value="${param.username}"
                                   required
                                   minlength="3"
                                   pattern="[a-zA-Z0-9_]+"
                                   class="w-full pl-10 pr-4 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                   placeholder="minimal 3 karakter">
                            <div class="text-xs text-gray-500 mt-1">
                                Hanya huruf, angka, dan underscore (_)
                            </div>
                        </div>
                    </div>
                    
                    <!-- Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5">
                            Password <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                <span class="material-icons-round text-lg">lock</span>
                            </span>
                            <input type="password" 
                                   id="password"
                                   name="password" 
                                   required
                                   minlength="6"
                                   oninput="updatePasswordStrength()"
                                   class="w-full pl-10 pr-10 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                   placeholder="minimal 6 karakter">
                            <button type="button" 
                                    onclick="togglePassword('password', 'passwordIcon')"
                                    class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <span id="passwordIcon" class="material-icons-round text-lg">visibility</span>
                            </button>
                        </div>
                        <div id="passwordStrength" class="h-2 rounded-full mt-1 bg-red-500 w-1/4"></div>
                        <p id="passwordStrengthText" class="text-xs text-red-500 mt-1">Lemah</p>
                    </div>
                    
                    <!-- Confirm Password -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1.5">
                            Konfirmasi Password <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                <span class="material-icons-round text-lg">lock</span>
                            </span>
                            <input type="password" 
                                   id="confirmPassword"
                                   name="confirmPassword" 
                                   required
                                   minlength="6"
                                   class="w-full pl-10 pr-10 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg 
                                          bg-white dark:bg-gray-700 text-gray-900 dark:text-white
                                          focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
                                   placeholder="ulangi password">
                            <button type="button" 
                                    onclick="togglePassword('confirmPassword', 'confirmPasswordIcon')"
                                    class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <span id="confirmPasswordIcon" class="material-icons-round text-lg">visibility</span>
                            </button>
                        </div>
                        <p id="passwordMatch" class="text-xs text-gray-500 mt-1"></p>
                    </div>
                    
                    <!-- Terms and Conditions -->
                    <div class="flex items-start">
                        <input type="checkbox" 
                               id="terms"
                               name="terms" 
                               required
                               class="mt-1 mr-3 rounded border-gray-300 text-primary focus:ring-primary">
                        <label for="terms" class="text-sm text-gray-600 dark:text-gray-300">
                            Saya setuju dengan 
                            <a href="#" class="text-primary hover:underline">Syarat & Ketentuan</a> 
                            dan 
                            <a href="#" class="text-primary hover:underline">Kebijakan Privasi</a>
                        </label>
                    </div>
                    
                    <!-- Submit Button -->
                    <button type="submit" 
                            class="w-full bg-primary hover:bg-primary-dark text-white font-semibold 
                                   py-3 rounded-lg shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 
                                   transition-all transform hover:-translate-y-0.5 active:translate-y-0 
                                   focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary">
                        Buat Akun
                    </button>
                </form>
                
                <!-- Login Link -->
                <div class="mt-8 pt-6 border-t border-gray-100 dark:border-gray-700 text-center">
                    <p class="text-sm text-gray-600 dark:text-gray-300">
                        Sudah punya akun? 
                        <a href="${pageContext.request.contextPath}/auth/login.jsp" 
                           class="font-semibold text-primary hover:text-primary-dark transition-colors ml-1">
                            Masuk di sini
                        </a>
                    </p>
                </div>
                
                <!-- Mobile only: Back to login -->
                <div class="md:hidden mt-8 text-center">
                    <a href="${pageContext.request.contextPath}/auth/login.jsp" 
                       class="inline-flex items-center text-primary hover:text-primary-dark">
                        <span class="material-icons-round mr-2">arrow_back</span>
                        Kembali ke Halaman Login
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="fixed bottom-4 text-center w-full text-xs text-gray-500 dark:text-gray-400">
        © 2026 FinDash PFM. All rights reserved.
    </div>
    
    <!-- Dark Mode Toggle -->
    <script>
        const toggleBtn = document.createElement('button');
        toggleBtn.className = 'fixed top-4 right-4 p-2 rounded-full bg-white/10 dark:bg-black/20 text-gray-600 dark:text-gray-300 hover:bg-white/20 dark:hover:bg-black/40 backdrop-blur-md border border-gray-200/20 transition-all z-50';
        toggleBtn.innerHTML = '<span class="material-icons-round text-xl">dark_mode</span>';
        toggleBtn.onclick = () => {
            document.documentElement.classList.toggle('dark');
            if (document.documentElement.classList.contains('dark')) {
                localStorage.theme = 'dark';
                toggleBtn.innerHTML = '<span class="material-icons-round text-xl">light_mode</span>';
            } else {
                localStorage.theme = 'light';
                toggleBtn.innerHTML = '<span class="material-icons-round text-xl">dark_mode</span>';
            }
        };
        document.body.appendChild(toggleBtn);
        
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark');
            toggleBtn.innerHTML = '<span class="material-icons-round text-xl">light_mode</span>';
        }
        
        // Real-time password match check
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirm = this.value;
            const matchText = document.getElementById('passwordMatch');
            
            if (confirm.length === 0) {
                matchText.textContent = '';
            } else if (password === confirm) {
                matchText.textContent = '✓ Password cocok';
                matchText.className = 'text-xs text-green-500 mt-1';
            } else {
                matchText.textContent = '✗ Password tidak cocok';
                matchText.className = 'text-xs text-red-500 mt-1';
            }
        });
        
        // Form validation before submit
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirm = document.getElementById('confirmPassword').value;
            const terms = document.getElementById('terms');
            
            if (password !== confirm) {
                e.preventDefault();
                alert('Password dan konfirmasi password tidak cocok!');
                return false;
            }
            
            if (!terms.checked) {
                e.preventDefault();
                alert('Anda harus menyetujui Syarat & Ketentuan!');
                return false;
            }
            
            return true;
        });
    </script>
</body>
</html>
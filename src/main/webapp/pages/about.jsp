<%-- 
    Document   : about
    Created on : 7 Jan 2026, 09.43.29
    Author     : HP 14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="space-y-8">
    
    <div class="bg-white dark:bg-surface-dark rounded-xl shadow-soft p-8 text-center border border-gray-100 dark:border-gray-700">
        <div class="w-16 h-16 bg-blue-100 text-primary rounded-full flex items-center justify-center mx-auto mb-4">
            <span class="material-icons-round text-3xl">savings</span>
        </div>
        <h1 class="text-3xl font-bold text-gray-800 dark:text-white mb-2">PFM Dashboard</h1>
        <p class="text-gray-500 dark:text-gray-400 max-w-2xl mx-auto">
            Aplikasi Personal Finance Management sederhana untuk membantu kamu mencatat pemasukan dan pengeluaran harian dengan mudah, cepat, dan rapi.
        </p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="p-6 bg-white dark:bg-surface-dark rounded-xl shadow-soft border-t-4 border-blue-500">
            <span class="material-icons-round text-blue-500 text-4xl mb-3">dashboard</span>
            <h3 class="font-bold text-lg text-gray-800 dark:text-white mb-2">Ringkasan Jelas</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400">Lihat total saldo, pemasukan, dan pengeluaranmu dalam satu tampilan dashboard yang bersih.</p>
        </div>

        <div class="p-6 bg-white dark:bg-surface-dark rounded-xl shadow-soft border-t-4 border-green-500">
            <span class="material-icons-round text-green-500 text-4xl mb-3">receipt_long</span>
            <h3 class="font-bold text-lg text-gray-800 dark:text-white mb-2">Catat Transaksi</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400">Input transaksi harianmu semudah update status, lengkap dengan tanggal dan kategori.</p>
        </div>

        <div class="p-6 bg-white dark:bg-surface-dark rounded-xl shadow-soft border-t-4 border-purple-500">
            <span class="material-icons-round text-purple-500 text-4xl mb-3">history</span>
            <h3 class="font-bold text-lg text-gray-800 dark:text-white mb-2">Riwayat Lengkap</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400">Pantau kemana saja uangmu pergi lewat fitur riwayat transaksi yang tersusun rapi.</p>
        </div>
    </div>

    <!-- TIM DEVELOPER -->
    <div class="bg-white dark:bg-surface-dark rounded-xl shadow-soft p-8 border border-gray-100 dark:border-gray-700">
        <h2 class="text-2xl font-bold text-gray-800 dark:text-white mb-6 text-center">Tim Pengembang</h2>
        
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-6">
            <!-- Developer 1 (Cowo) - Project Manager -->
            <div class="bg-gradient-to-br from-blue-50 to-white dark:from-gray-800 dark:to-surface-dark rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-blue-100 dark:border-gray-700 text-center hover:-translate-y-1">
                <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-blue-100 dark:bg-blue-900 flex items-center justify-center border-4 border-white dark:border-gray-700">
                    <span class="material-icons-round text-3xl text-blue-600 dark:text-blue-300">manage_accounts</span>
                </div>
                <h3 class="font-bold text-gray-800 dark:text-white mb-1">Salman Maula As-Shidqi</h3>
                <p class="text-sm text-blue-600 dark:text-blue-400 font-medium mb-2">Project Manager</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Mengatur timeline dan koordinasi tim</p>
            </div>

            <!-- Developer 2 (Cowo) - Full Stack -->
            <div class="bg-gradient-to-br from-green-50 to-white dark:from-gray-800 dark:to-surface-dark rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-green-100 dark:border-gray-700 text-center hover:-translate-y-1">
                <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-green-100 dark:bg-green-900 flex items-center justify-center border-4 border-white dark:border-gray-700">
                    <span class="material-icons-round text-3xl text-green-600 dark:text-green-300">code</span>
                </div>
                <h3 class="font-bold text-gray-800 dark:text-white mb-1">Muhammad Zakri Alfiansyah</h3>
                <p class="text-sm text-green-600 dark:text-green-400 font-medium mb-2">Full Stack Developer</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Membangun sistem frontend dan backend</p>
            </div>

            <!-- Developer 3 (Cewe) - Frontend -->
            <div class="bg-gradient-to-br from-purple-50 to-white dark:from-gray-800 dark:to-surface-dark rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-purple-100 dark:border-gray-700 text-center hover:-translate-y-1">
                <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-purple-100 dark:bg-purple-900 flex items-center justify-center border-4 border-white dark:border-gray-700">
                    <span class="material-icons-round text-3xl text-purple-600 dark:text-purple-300">palette</span>
                </div>
                <h3 class="font-bold text-gray-800 dark:text-white mb-1">Yurida Yahsya</h3>
                <p class="text-sm text-purple-600 dark:text-purple-400 font-medium mb-2">Frontend Developer</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Mendesain UI/UX yang user-friendly</p>
            </div>

            <!-- Developer 4 (Cewe) - Database -->
            <div class="bg-gradient-to-br from-pink-50 to-white dark:from-gray-800 dark:to-surface-dark rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-pink-100 dark:border-gray-700 text-center hover:-translate-y-1">
                <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-pink-100 dark:bg-pink-900 flex items-center justify-center border-4 border-white dark:border-gray-700">
                    <span class="material-icons-round text-3xl text-pink-600 dark:text-pink-300">storage</span>
                </div>
                <h3 class="font-bold text-gray-800 dark:text-white mb-1">Ayu Della Astuti</h3>
                <p class="text-sm text-pink-600 dark:text-pink-400 font-medium mb-2">Database Designer</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Merancang dan mengoptimasi database</p>
            </div>

            <!-- Developer 5 (Cowo) - Backend -->
            <div class="bg-gradient-to-br from-orange-50 to-white dark:from-gray-800 dark:to-surface-dark rounded-xl p-6 shadow-md hover:shadow-lg transition-all duration-300 border border-orange-100 dark:border-gray-700 text-center hover:-translate-y-1">
                <div class="w-20 h-20 mx-auto mb-4 rounded-full bg-orange-100 dark:bg-orange-900 flex items-center justify-center border-4 border-white dark:border-gray-700">
                    <span class="material-icons-round text-3xl text-orange-600 dark:text-orange-300">api</span>
                </div>
                <h3 class="font-bold text-gray-800 dark:text-white mb-1">Kaff Abidillah</h3>
                <p class="text-sm text-orange-600 dark:text-orange-400 font-medium mb-2">Backend Developer</p>
                <p class="text-xs text-gray-500 dark:text-gray-400">Mengembangkan API dan business logic</p>
            </div>
        </div>
        
        <!-- Deskripsi Tim -->
        <div class="mt-8 pt-6 border-t border-gray-100 dark:border-gray-700 text-center">
            <p class="text-gray-600 dark:text-gray-400 text-sm">
                Tim kami terdiri dari 5 mahasiswa Teknik Informatika yang berkolaborasi untuk membuat aplikasi manajemen keuangan ini.
                Dengan komposisi 3 developer pria dan 2 developer wanita, kami menggabungkan berbagai keahlian untuk menciptakan solusi yang optimal.
            </p>
        </div>
    </div>

    <!-- ABOUT DEVELOPER -->
    <div class="bg-gradient-to-r from-primary to-blue-600 rounded-xl shadow-lg p-8 text-white flex flex-col sm:flex-row items-center gap-6">
        <div class="w-24 h-24 bg-white/20 rounded-full flex items-center justify-center text-4xl backdrop-blur-sm shrink-0">
            💼 
        </div>
        
        <div class="text-center sm:text-left">
            <h2 class="text-xl font-bold mb-1">Tentang Pengembangan Aplikasi</h2>
            <p class="text-blue-100 text-sm mb-4">Proyek Tugas Akhir - Pemrograman Berbasis Web</p>
            <p class="text-white/80 text-sm max-w-2xl">
                Aplikasi ini dikembangkan oleh tim mahasiswa sebagai bagian dari tugas mata kuliah Pemrograman Berbasis Web.
                Dengan menggunakan teknologi Java Servlet, JSP, dan PostgreSQL, kami bertujuan untuk menciptakan aplikasi
                manajemen keuangan yang sederhana namun powerful untuk membantu pengguna mengatur keuangan pribadi.
            </p>
        </div>
    </div>

    <!-- TECH STACK -->
    <div class="bg-white dark:bg-surface-dark rounded-xl shadow-soft p-8 border border-gray-100 dark:border-gray-700">
        <h2 class="text-xl font-bold text-gray-800 dark:text-white mb-4 text-center">🛠️ Teknologi yang Digunakan</h2>
        <div class="flex flex-wrap justify-center gap-3">
            <span class="px-3 py-1.5 bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">code</span> Java Servlet
            </span>
            <span class="px-3 py-1.5 bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">web</span> JSP
            </span>
            <span class="px-3 py-1.5 bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">storage</span> PostgreSQL
            </span>
            <span class="px-3 py-1.5 bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">style</span> Tailwind CSS
            </span>
            <span class="px-3 py-1.5 bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">database</span> JDBC
            </span>
            <span class="px-3 py-1.5 bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-200 rounded-full text-sm font-medium flex items-center gap-1">
                <span class="material-icons-round text-xs">architecture</span> MVC Pattern
            </span>
        </div>
    </div>

</div>

<style>
    /* Efek hover untuk card developer */
    .developer-card {
        transition: all 0.3s ease;
    }
    
    .developer-card:hover {
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
    }
    
    /* Responsive adjustments */
    @media (max-width: 640px) {
        .grid-cols-5 {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
    
    @media (max-width: 480px) {
        .grid-cols-5 {
            grid-template-columns: repeat(1, minmax(0, 1fr));
        }
    }
</style>
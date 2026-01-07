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

    <div class="bg-gradient-to-r from-primary to-blue-600 rounded-xl shadow-lg p-8 text-white flex flex-col sm:flex-row items-center gap-6">
        <div class="w-24 h-24 bg-white/20 rounded-full flex items-center justify-center text-4xl backdrop-blur-sm shrink-0">
            😎 </div>
        
        <div class="text-center sm:text-left">
            <h2 class="text-xl font-bold mb-1">Dibuat oleh </h2>
            <p class="text-blue-100 text-sm mb-4">Mahasiswa Teknik Informatika | Fullstack Developer Wannable</p>
            <p class="text-white/80 text-sm italic">
                "Project ini dibuat untuk memenuhi tugas kuliah sekaligus belajar bikin aplikasi web pakai Java Servlet & JSP."
            </p>
        </div>
    </div>

</div>
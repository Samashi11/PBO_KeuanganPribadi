<!-- Cari bagian header/navbar di file dashboard.jsp Anda -->
<!-- Biasanya di atas atau sebelum <div class="flex-grow bg-surface-dark rounded-xl shadow-sm p-6"> -->

<div class="flex justify-between items-center px-6 py-4 bg-surface-dark rounded-t-xl border-b border-gray-200 dark:border-gray-700">
    <!-- Kiri: Logo/Brand -->
    <div class="flex items-center space-x-3">
        <div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center">
            <span class="material-icons-round text-white">account_balance</span>
        </div>
        <div>
            <h2 class="text-xl font-bold text-text-light dark:text-text-dark">Dashboard</h2>
            <p class="text-sm text-muted-light dark:text-muted-dark">Welcome back, ${sessionScope.user.namaLengkap}</p>
        </div>
    </div>
    
    <!-- Kanan: User Menu -->
    <div class="relative group">
        <!-- User Avatar/Button -->
        <button class="flex items-center space-x-3 px-4 py-2 bg-gray-50 dark:bg-gray-800 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-xl transition-all">
            <div class="w-10 h-10 rounded-full bg-gradient-to-r from-primary to-blue-400 flex items-center justify-center text-white font-bold">
                ${sessionScope.user.namaLengkap.charAt(0)}
            </div>
            <div class="text-left">
                <p class="font-medium text-text-light dark:text-text-dark">${sessionScope.user.namaLengkap}</p>
                <p class="text-xs text-muted-light dark:text-muted-dark">${sessionScope.user.role.namaRole}</p>
            </div>
            <span class="material-icons-round text-muted-light dark:text-muted-dark">expand_more</span>
        </button>
        
        <!-- Dropdown Menu -->
        <div class="absolute right-0 mt-2 w-56 bg-white dark:bg-gray-800 rounded-xl shadow-card border border-gray-100 dark:border-gray-700 py-2 hidden group-hover:block z-50">
            <div class="px-4 py-3 border-b border-gray-100 dark:border-gray-700">
                <p class="font-medium text-text-light dark:text-text-dark">${sessionScope.user.namaLengkap}</p>
                <p class="text-sm text-muted-light dark:text-muted-dark">${sessionScope.user.email}</p>
            </div>
            
            <a href="${pageContext.request.contextPath}/profile" 
               class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">person</span>
                <span>Profil Saya</span>
            </a>
            
            <!-- MENU GANTI PASSWORD -->
            <a href="${pageContext.request.contextPath}/change-password" 
               class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">lock_reset</span>
                <span>Ganti Password</span>
            </a>
            
            <a href="${pageContext.request.contextPath}/settings" 
               class="flex items-center px-4 py-3 text-text-light dark:text-text-dark hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                <span class="material-icons-round mr-3 text-muted-light dark:text-muted-dark">settings</span>
                <span>Pengaturan</span>
            </a>
            
            <div class="border-t border-gray-100 dark:border-gray-700 my-2"></div>
            
            <a href="${pageContext.request.contextPath}/logout" 
               class="flex items-center px-4 py-3 text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-colors">
                <span class="material-icons-round mr-3">logout</span>
                <span>Keluar</span>
            </a>
        </div>
    </div>
</div>

<script>
// Script untuk toggle dropdown jika diklik
document.addEventListener('DOMContentLoaded', function() {
    const userMenuBtn = document.querySelector('.group button');
    const userMenu = document.querySelector('.group .hidden');
    
    if (userMenuBtn && userMenu) {
        userMenuBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            userMenu.classList.toggle('hidden');
        });
        
        // Tutup dropdown jika klik di luar
        document.addEventListener('click', function() {
            userMenu.classList.add('hidden');
        });
        
        // Cegah dropdown tertutup saat klik di dalam dropdown
        userMenu.addEventListener('click', function(e) {
            e.stopPropagation();
        });
    }
});
</script>

<div class="flex-grow bg-surface-dark rounded-xl shadow-sm p-6">
  <!--- Hero Section --->
  <section class="mb-10 bg-gradient-to-r from-primary/10 to-blue-100/30 dark:from-primary/20 dark:to-blue-900/20 rounded-2xl shadow-soft border border-gray-100 dark:border-gray-700">
    <div class="p-8 md:p-12 grid grid-cols-1 lg:grid-cols-2 gap-8 items-center">
      <!--- Introduction --->
      <div class="space-y-6">
        <div class="inline-flex items-center gap-2 px-4 py-2 bg-primary/10 dark:bg-primary/20 text-primary dark:text-blue-300 rounded-full text-sm font-medium">
          <span class="material-icons-round text-lg">auto_graph</span>
          Smart Financial Dashboard
        </div>
        
        <h1 class="text-4xl md:text-5xl font-bold text-black dark:text-white leading-tight">
          Take Control of Your
          <span class="text-primary dark:text-blue-400">Financial Future</span>
        </h1>
        
        <p class="text-lg text-gray-700 dark:text-gray-300 max-w-xl">
          Track income, expenses, and investments in one place. Get actionable insights to optimize your finances and achieve your financial goals faster.
        </p>
        
        <div class="flex flex-col sm:flex-row gap-4 pt-4">
          <button class="px-6 py-3 bg-primary hover:bg-primary-dark dark:bg-blue-600 dark:hover:bg-blue-700 text-white font-medium rounded-lg flex items-center justify-center gap-2 transition-all hover:shadow-md">
            <span class="material-icons-round">rocket_launch</span>
            Get Started Free
          </button>
          <button class="px-6 py-3 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-800 dark:text-gray-200 font-medium rounded-lg border border-gray-200 dark:border-gray-700 flex items-center justify-center gap-2 transition-all">
            <span class="material-icons-round">play_circle</span>
            Watch Demo
          </button>
        </div>
        
        <div class="pt-6 flex items-center gap-6 text-sm text-gray-600 dark:text-gray-400">
          <div class="flex items-center gap-2">
            <span class="material-icons-round text-green-500 text-lg">verified</span>
            <span>No credit card required</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="material-icons-round text-green-500 text-lg">verified</span>
            <span>14-day free trial</span>
          </div>
        </div>
      </div>
      
      <!--- Features Highlight --->
      <div class="grid grid-cols-2 gap-4">
        <div class="bg-white/50 dark:bg-gray-800/50 backdrop-blur-sm p-5 rounded-xl border border-gray-100 dark:border-gray-700 hover:shadow-md transition-shadow">
          <div class="w-12 h-12 rounded-lg bg-green-100 dark:bg-green-900/30 flex items-center justify-center text-green-600 dark:text-green-400 mb-4">
            <span class="material-icons-round text-2xl">insights</span>
          </div>
          <h3 class="font-bold text-black dark:text-white mb-2">Real-time Analytics</h3>
          <p class="text-sm text-gray-600 dark:text-gray-400">Live updates on your financial performance with detailed insights.</p>
        </div>
        
        <div class="bg-white/50 dark:bg-gray-800/50 backdrop-blur-sm p-5 rounded-xl border border-gray-100 dark:border-gray-700 hover:shadow-md transition-shadow">
          <div class="w-12 h-12 rounded-lg bg-blue-100 dark:bg-blue-900/30 flex items-center justify-center text-blue-600 dark:text-blue-400 mb-4">
            <span class="material-icons-round text-2xl">security</span>
          </div>
          <h3 class="font-bold text-black dark:text-white mb-2">Bank-level Security</h3>
          <p class="text-sm text-gray-600 dark:text-gray-400">Your data is protected with end-to-end encryption and secure protocols.</p>
        </div>
        
        <div class="bg-white/50 dark:bg-gray-800/50 backdrop-blur-sm p-5 rounded-xl border border-gray-100 dark:border-gray-700 hover:shadow-md transition-shadow">
          <div class="w-12 h-12 rounded-lg bg-purple-100 dark:bg-purple-900/30 flex items-center justify-center text-purple-600 dark:text-purple-400 mb-4">
            <span class="material-icons-round text-2xl">sync_alt</span>
          </div>
          <h3 class="font-bold text-black dark:text-white mb-2">Auto-sync Accounts</h3>
          <p class="text-sm text-gray-600 dark:text-gray-400">Connect all your financial accounts for automatic transaction tracking.</p>
        </div>
        
        <div class="bg-white/50 dark:bg-gray-800/50 backdrop-blur-sm p-5 rounded-xl border border-gray-100 dark:border-gray-700 hover:shadow-md transition-shadow">
          <div class="w-12 h-12 rounded-lg bg-orange-100 dark:bg-orange-900/30 flex items-center justify-center text-orange-600 dark:text-orange-400 mb-4">
            <span class="material-icons-round text-2xl">notifications</span>
          </div>
          <h3 class="font-bold text-black dark:text-white mb-2">Smart Alerts</h3>
          <p class="text-sm text-gray-600 dark:text-gray-400">Get notified about unusual spending, bills, and investment opportunities.</p>
        </div>
      </div>
    </div>
    
    <!--- Decorative Elements --->
    <div class="absolute top-10 right-10 w-40 h-40 bg-primary/5 dark:bg-primary/10 rounded-full blur-3xl"></div>
    <div class="absolute bottom-10 left-10 w-60 h-60 bg-blue-300/5 dark:bg-blue-500/10 rounded-full blur-3xl"></div>
  </section>
</div>
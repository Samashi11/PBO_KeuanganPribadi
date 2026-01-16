<!-- Cari bagian header/navbar di file dashboard.jsp Anda -->
<!-- Biasanya di atas atau sebelum <div class="flex-grow bg-surface-dark rounded-xl shadow-sm p-6"> -->

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
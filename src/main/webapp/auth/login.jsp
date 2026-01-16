<%-- 
    Document   : login
    Created on : Jan 12, 2026, 8:55:51 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>PFM Login</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet"/>
        <script>
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            primary: "#3B82F6", // Blue for trust/finance
                            "primary-dark": "#2563EB",
                            "background-light": "#F3F4F6", // Light gray background
                            "background-dark": "#111827", // Dark gray background
                            "surface-light": "#FFFFFF",
                            "surface-dark": "#1F2937",
                            "text-light": "#1F2937",
                            "text-dark": "#F9FAFB",
                            "muted-light": "#6B7280",
                            "muted-dark": "#9CA3AF",
                        },
                        fontFamily: {
                            display: ["Inter", "sans-serif"],
                            body: ["Inter", "sans-serif"],
                        },
                        borderRadius: {
                            DEFAULT: "0.5rem",
                            xl: "1rem",
                            "2xl": "1.5rem",
                        },
                        boxShadow: {
                            'soft': '0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03)',
                            'card': '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
                        }
                    },
                },
            };
        </script>
    </head>
    <body class="bg-gray-50 dark:bg-background-dark font-body min-h-screen flex items-center justify-center p-4 sm:p-6 lg:p-8 transition-colors duration-300 relative overflow-hidden">
        <div class="absolute inset-0 overflow-hidden pointer-events-none">
            <div class="absolute -top-[10%] -left-[10%] w-[50%] h-[50%] bg-blue-400/20 rounded-full blur-[100px] animate-pulse"></div>
            <div class="absolute top-[20%] right-[-10%] w-[40%] h-[40%] bg-indigo-500/20 rounded-full blur-[100px]"></div>
            <div class="absolute -bottom-[10%] left-[20%] w-[30%] h-[30%] bg-purple-400/20 rounded-full blur-[100px]"></div>
        </div>
        <div class="w-full max-w-md bg-surface-light dark:bg-surface-dark rounded-2xl shadow-card border border-gray-100 dark:border-gray-700 p-8 sm:p-10 relative z-10 backdrop-blur-sm">
            <div class="flex flex-col items-center mb-8">
                <div class="w-14 h-14 bg-gradient-to-br from-primary to-indigo-600 rounded-xl shadow-lg flex items-center justify-center text-white mb-4 transform rotate-3 hover:rotate-6 transition-transform duration-300">
                    <span class="material-icons-round text-3xl">account_balance</span>
                </div>
                <h1 class="text-2xl font-bold text-text-light dark:text-text-dark tracking-tight">FinDash PFM</h1>
                <p class="text-muted-light dark:text-muted-dark text-sm mt-2 text-center">Welcome back! Please enter your details.</p>
            </div>
            <form class="space-y-5" method="post" action="${pageContext.request.contextPath}/login">
                <div>
                    <label class="block text-sm font-medium text-text-light dark:text-text-dark mb-1.5" for="email">Username</label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-muted-light dark:text-muted-dark">
                            <span class="material-icons-round text-lg">mail_outline</span>
                        </span>
                        <input class="w-full pl-10 pr-4 py-2.5 bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-sm text-text-light dark:text-text-dark focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all shadow-sm" id="username" placeholder="Username" required name="username" required="" type="text"/>
                    </div>
                </div>
                <div>
                    <div class="flex justify-between items-center mb-1.5">
                        <label class="block text-sm font-medium text-text-light dark:text-text-dark" for="password">Password</label>
                    </div>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-muted-light dark:text-muted-dark">
                            <span class="material-icons-round text-lg">lock_outline</span>
                        </span>
                        <input class="w-full pl-10 pr-4 py-2.5 bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-sm text-text-light dark:text-text-dark focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all shadow-sm" id="password" placeholder="••••••••" required name="password" type="password"/>
                    </div>
                    <div class="flex justify-end mt-2">
                        <a class="text-xs font-medium text-primary hover:text-primary-dark hover:underline transition-colors" href="#">Forgot Password?</a>
                    </div>
                </div>
                <button class="w-full bg-primary hover:bg-primary-dark text-white font-semibold py-2.5 rounded-lg shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 transition-all transform hover:-translate-y-0.5 active:translate-y-0 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary dark:focus:ring-offset-gray-900 mt-2" type="submit">
                    Sign In
                </button>
            </form>
            <div class="mt-8 pt-6 border-t border-gray-100 dark:border-gray-700 text-center">
                <p class="text-sm text-muted-light dark:text-muted-dark">
                    Don't have an account? 
                    <a class="font-semibold text-primary hover:text-primary-dark transition-colors ml-1" 
                       href="${pageContext.request.contextPath}/register">
                        Create an account
                    </a>
                </p>
            </div>
        </div>
        <div class="absolute bottom-6 text-xs text-muted-light/50 dark:text-muted-dark/30 text-center w-full">
            © 2023 FinDash PFM. All rights reserved.
        </div>
        <script>
            // Check local storage or system preference
            if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
                document.documentElement.classList.add('dark')
            } else {
                document.documentElement.classList.remove('dark')
            }
            // Simple toggle button
            const toggleBtn = document.createElement('button');
            toggleBtn.className = 'fixed top-4 right-4 p-2 rounded-full bg-white/10 dark:bg-black/20 text-muted-light dark:text-muted-dark hover:bg-white/20 dark:hover:bg-black/40 backdrop-blur-md border border-gray-200/20 transition-all z-50';
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
            // Set initial icon
            if (document.documentElement.classList.contains('dark')) {
                toggleBtn.innerHTML = '<span class="material-icons-round text-xl">light_mode</span>';
            }
        </script>

    </body>
</html>

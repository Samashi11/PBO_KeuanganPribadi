<%-- 
    Document   : index
    Created on : Dec 28, 2025, 1:42:37 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>FinDash</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons+Round"
            rel="stylesheet"
            />
        <!--<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"-->
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
                            "accent-green": "#10B981",
                            "accent-red": "#EF4444",
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
                            soft: "0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03)",
                        },
                    },
                },
            };
        </script>
        <style>
            ::-webkit-scrollbar {
                width: 8px;
            }
            ::-webkit-scrollbar-track {
                background: transparent;
            }
            ::-webkit-scrollbar-thumb {
                background-color: #cbd5e1;
                border-radius: 20px;
            }
            .dark ::-webkit-scrollbar-thumb {
                background-color: #374151;
            }
        </style>
    </head>
    <body
        class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark font-body min-h-screen flex flex-col transition-colors duration-300"
        >
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl flex flex-col gap-6 py-6"
             >
            <%@ include file="layout/header.jsp" %>
            <%@ include file="layout/navbar.jsp" %>
            <!--<div class="grid grid-cols-1 lg:grid-cols-3 xl:grid-cols-4 gap-6">-->
            <div class="flex flex-col lg:flex-row gap-4 h-full">
                <jsp:include page="layout/main.jsp" />
                <jsp:include page="layout/sidebar.jsp" />
            </div>
            <%@ include file="layout/footer.jsp" %>
        </div>
        <script>
            // Check local storage or system preference
            if (
                    localStorage.theme === "dark" ||
                    (!("theme" in localStorage) &&
                            window.matchMedia("(prefers-color-scheme: dark)").matches)
                    ) {
                document.documentElement.classList.add("dark");
            } else {
                document.documentElement.classList.remove("dark");
            }
            // Simple toggle button for demo (fixed position)
            const toggleBtn = document.createElement("button");
            toggleBtn.className =
                    "fixed bottom-4 right-4 p-3 rounded-full bg-primary text-white shadow-lg z-50 hover:bg-primary-dark transition-colors";
            toggleBtn.innerHTML =
                    '<span class="material-icons-round">dark_mode</span>';
            toggleBtn.onclick = () => {
                document.documentElement.classList.toggle("dark");
                if (document.documentElement.classList.contains("dark")) {
                    localStorage.theme = "dark";
                    toggleBtn.innerHTML =
                            '<span class="material-icons-round">light_mode</span>';
                } else {
                    localStorage.theme = "light";
                    toggleBtn.innerHTML =
                            '<span class="material-icons-round">dark_mode</span>';
                }
            };
            document.body.appendChild(toggleBtn);
            // Set initial icon
            if (document.documentElement.classList.contains("dark")) {
                toggleBtn.innerHTML =
                        '<span class="material-icons-round">light_mode</span>';
            }
        </script>
    </body>
</html>

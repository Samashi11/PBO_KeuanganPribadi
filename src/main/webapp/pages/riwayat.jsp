<main
    class="flex-grow bg-surface-light dark:bg-surface-dark rounded-xl shadow-sm p-6"
    >
    <div class="flex justify-between items-center mb-6">
        <h2
            class="text-xl font-bold text-gray-900 dark:text-white flex items-center gap-2"
            >
            <span class="material-icons-round text-primary">history</span>
            Recent Transactions
        </h2>
        <div class="flex gap-2">
            <button
                class="text-sm flex items-center gap-1 text-gray-500 dark:text-gray-400 hover:text-primary transition"
                >
                <span class="material-icons-round text-base"
                      >file_download</span
                >
                Export
            </button>
        </div>
    </div>
    <div class="relative w-full mb-6">
        <span
            class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
            >
            <span class="material-icons-round text-gray-400">search</span>
        </span>
        <input
            class="pl-10 block w-full rounded-lg border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:border-primary focus:ring focus:ring-primary focus:ring-opacity-50"
            placeholder="Search transactions..."
            type="text"
            />
    </div>
    <div class="overflow-x-auto">
        <table class="w-full text-left border-collapse">
            <thead>
                <tr
                    class="text-gray-500 dark:text-gray-400 text-xs uppercase border-b border-gray-100 dark:border-gray-700"
                    >
                    <th class="py-3 font-semibold">Date</th>
                    <th class="py-3 font-semibold">Description</th>
                    <th class="py-3 font-semibold">Category</th>
                    <th class="py-3 font-semibold">Account</th>
                    <th class="py-3 font-semibold text-right">Amount</th>
                    <th class="py-3 font-semibold text-center">Status</th>
                </tr>
            </thead>
            <tbody class="text-sm">
                <tr
                    class="border-b border-gray-50 dark:border-gray-700/50 hover:bg-gray-50 dark:hover:bg-gray-700/30 transition-colors"
                    >
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Oct 24, 2023
                    </td>
                    <td
                        class="py-4 font-medium text-gray-900 dark:text-white flex items-center gap-3"
                        >
                        <div
                            class="w-8 h-8 rounded bg-orange-100 text-orange-600 flex items-center justify-center"
                            >
                            <span class="material-icons-round text-sm"
                                  >shopping_bag</span
                            >
                        </div>
                        Amazon Purchase
                    </td>
                    <td class="py-4 text-gray-600 dark:text-gray-300">
                        Shopping
                    </td>
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Chase ****4590
                    </td>
                    <td
                        class="py-4 text-right font-medium text-gray-900 dark:text-white"
                        >
                        -$124.50
                    </td>
                    <td class="py-4 text-center">
                        <span
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                            >
                            Completed
                        </span>
                    </td>
                </tr>
                <tr
                    class="border-b border-gray-50 dark:border-gray-700/50 hover:bg-gray-50 dark:hover:bg-gray-700/30 transition-colors"
                    >
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Oct 23, 2023
                    </td>
                    <td
                        class="py-4 font-medium text-gray-900 dark:text-white flex items-center gap-3"
                        >
                        <div
                            class="w-8 h-8 rounded bg-blue-100 text-blue-600 flex items-center justify-center"
                            >
                            <span class="material-icons-round text-sm"
                                  >water_drop</span
                            >
                        </div>
                        City Water Utilities
                    </td>
                    <td class="py-4 text-gray-600 dark:text-gray-300">
                        Bills &amp; Utilities
                    </td>
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Checking ****1122
                    </td>
                    <td
                        class="py-4 text-right font-medium text-gray-900 dark:text-white"
                        >
                        -$45.00
                    </td>
                    <td class="py-4 text-center">
                        <span
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                            >
                            Completed
                        </span>
                    </td>
                </tr>
                <tr
                    class="border-b border-gray-50 dark:border-gray-700/50 hover:bg-gray-50 dark:hover:bg-gray-700/30 transition-colors"
                    >
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Oct 22, 2023
                    </td>
                    <td
                        class="py-4 font-medium text-gray-900 dark:text-white flex items-center gap-3"
                        >
                        <div
                            class="w-8 h-8 rounded bg-green-100 text-green-600 flex items-center justify-center"
                            >
                            <span class="material-icons-round text-sm"
                                  >attach_money</span
                            >
                        </div>
                        Payroll Deposit
                    </td>
                    <td class="py-4 text-gray-600 dark:text-gray-300">Income</td>
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Checking ****1122
                    </td>
                    <td
                        class="py-4 text-right font-medium text-green-600 dark:text-green-400"
                        >
                        +$2,450.00
                    </td>
                    <td class="py-4 text-center">
                        <span
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                            >
                            Completed
                        </span>
                    </td>
                </tr>
                <tr
                    class="border-b border-gray-50 dark:border-gray-700/50 hover:bg-gray-50 dark:hover:bg-gray-700/30 transition-colors"
                    >
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Oct 21, 2023
                    </td>
                    <td
                        class="py-4 font-medium text-gray-900 dark:text-white flex items-center gap-3"
                        >
                        <div
                            class="w-8 h-8 rounded bg-purple-100 text-purple-600 flex items-center justify-center"
                            >
                            <span class="material-icons-round text-sm">movie</span>
                        </div>
                        Netflix Subscription
                    </td>
                    <td class="py-4 text-gray-600 dark:text-gray-300">
                        Entertainment
                    </td>
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Chase ****4590
                    </td>
                    <td
                        class="py-4 text-right font-medium text-gray-900 dark:text-white"
                        >
                        -$15.99
                    </td>
                    <td class="py-4 text-center">
                        <span
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300"
                            >
                            Pending
                        </span>
                    </td>
                </tr>
                <tr
                    class="hover:bg-gray-50 dark:hover:bg-gray-700/30 transition-colors"
                    >
                    <td class="py-4 text-gray-500 dark:text-gray-400">
                        Oct 20, 2023
                    </td>
                    <td
                        class="py-4 font-medium text-gray-900 dark:text-white flex items-center gap-3"
                        >
                        <div
                            class="w-8 h-8 rounded bg-rose-100 text-rose-600 flex items-center justify-center"
                            >
                            <span class="material-icons-round text-sm"
                                  >restaurant</span
                            >
                        </div>
                        Starbucks Coffee
                    </td>
                    <td class="py-4 text-gray-600 dark:text-gray-300">
                        Food &amp; Drink
                    </td>
                    <td class="py-4 text-gray-500 dark:text-gray-400">Cash</td>
                    <td
                        class="py-4 text-right font-medium text-gray-900 dark:text-white"
                        >
                        -$6.45
                    </td>
                    <td class="py-4 text-center">
                        <span
                            class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300"
                            >
                            Completed
                        </span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div
        class="flex items-center justify-between mt-6 pt-4 border-t border-gray-100 dark:border-gray-700"
        >
        <p class="text-sm text-gray-500 dark:text-gray-400">
            Showing <span class="font-medium">1</span> to
            <span class="font-medium">5</span> of
            <span class="font-medium">42</span> results
        </p>
        <div class="flex gap-2">
            <button
                class="px-3 py-1 text-sm border border-gray-300 dark:border-gray-600 rounded hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-600 dark:text-gray-300"
                >
                Previous
            </button>
            <button
                class="px-3 py-1 text-sm border border-gray-300 dark:border-gray-600 rounded hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-600 dark:text-gray-300"
                >
                Next
            </button>
        </div>
    </div>
</main>
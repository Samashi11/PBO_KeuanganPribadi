<main
    class="flex-grow bg-surface-light dark:bg-surface-dark rounded-xl shadow-sm p-6"
    >
    <div class="p-6 sm:p-8">
        <div class="flex items-center justify-between mb-6">
            <h2
                class="text-xl font-bold text-gray-900 dark:text-white flex items-center gap-2"
                >
                <span class="material-icons-round text-primary"
                      >receipt_long</span
                >
                New Transaction
            </h2>
            <div class="flex bg-gray-100 dark:bg-gray-800 p-1 rounded-lg">
                <button
                    class="px-4 py-1.5 text-sm font-medium bg-white dark:bg-gray-700 text-primary shadow-sm rounded-md transition-all"
                    >
                    Expense
                </button>
                <button
                    class="px-4 py-1.5 text-sm font-medium text-gray-500 dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-200 transition-all"
                    >
                    Income
                </button>
            </div>
        </div>
        <form class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="col-span-1 md:col-span-2">
                    <label
                        class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                        for="amount"
                        >Amount</label
                    >
                    <div class="relative rounded-md shadow-sm">
                        <div
                            class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3"
                            >
                            <span class="text-gray-500 sm:text-lg">$</span>
                        </div>
                        <input
                            class="block w-full rounded-xl border-gray-300 dark:border-gray-600 pl-8 pr-12 pt-3 pb-3 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-lg dark:text-white placeholder-gray-400"
                            id="amount"
                            name="amount"
                            placeholder="0.00"
                            type="number"
                            />
                        <div
                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-3"
                            >
                            <span class="text-gray-500 sm:text-sm">USD</span>
                        </div>
                    </div>
                </div>
                <div class="col-span-1">
                    <label
                        class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                        for="date"
                        >Date</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                            >
                            <span class="material-icons-round text-gray-400 text-lg"
                                  >calendar_today</span
                            >
                        </div>
                        <input
                            class="block w-full rounded-xl border-gray-300 dark:border-gray-600 pl-10 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-sm dark:text-white"
                            id="date"
                            name="date"
                            type="date"
                            />
                    </div>
                </div>
                <div class="col-span-1">
                    <label
                        class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                        for="category"
                        >Category</label
                    >
                    <select
                        class="block w-full rounded-xl border-gray-300 dark:border-gray-600 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-sm dark:text-white"
                        id="category"
                        name="category"
                        >
                        <option>Food &amp; Dining</option>
                        <option>Transportation</option>
                        <option>Shopping</option>
                        <option>Entertainment</option>
                        <option>Bills &amp; Utilities</option>
                        <option>Others</option>
                    </select>
                </div>
                <div class="col-span-1 md:col-span-2">
                    <label
                        class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                        for="payee"
                        >Payee / Merchant</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none"
                            >
                            <span class="material-icons-round text-gray-400 text-lg"
                                  >storefront</span
                            >
                        </div>
                        <input
                            class="block w-full rounded-xl border-gray-300 dark:border-gray-600 pl-10 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-sm dark:text-white"
                            id="payee"
                            name="payee"
                            placeholder="e.g. Starbucks, Amazon, Rent"
                            type="text"
                            />
                    </div>
                </div>
                <div class="col-span-1 md:col-span-2">
                    <label
                        class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2"
                        for="notes"
                        >Notes (Optional)</label
                    >
                    <textarea
                        class="block w-full rounded-xl border-gray-300 dark:border-gray-600 focus:border-primary focus:ring-primary dark:bg-gray-800 sm:text-sm dark:text-white"
                        id="notes"
                        name="notes"
                        placeholder="Add any details here..."
                        rows="3"
                        ></textarea>
                </div>
            </div>
            <div
                class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100 dark:border-gray-700"
                >
                <button
                    class="px-5 py-2.5 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-xl hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-colors"
                    type="button"
                    >
                    Cancel
                </button>
                <button
                    class="px-5 py-2.5 text-sm font-medium text-white bg-primary hover:bg-primary-hover rounded-xl shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary transition-all flex items-center gap-2"
                    type="submit"
                    >
                    <span class="materialza-icons-round text-base">check</span> Save
                    Transaction
                </button>
            </div>
        </form>
    </div>
</main>
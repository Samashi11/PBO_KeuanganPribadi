<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="model.Anggaran" %>



<aside class="lg:col-span-1 xl:col-span-1 space-y-6">    

    <div
        class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl shadow-soft border border-gray-100 dark:border-gray-700"
        >
        <h2
            class="text-lg font-semibold text-text-light dark:text-text-dark mb-4"
            >
            My Cards
        </h2>
        <div
            class="w-full aspect-[1.586] bg-gradient-to-br from-gray-800 to-black rounded-xl p-5 text-white flex flex-col justify-between shadow-lg relative overflow-hidden group hover:shadow-xl transition-shadow cursor-pointer"
            >
            <div
                class="absolute top-0 right-0 w-32 h-32 bg-white opacity-5 rounded-full -mt-10 -mr-10"
                ></div>
            <div class="flex justify-between items-start">
                <span class="text-xs font-light tracking-widest opacity-80"
                      >Debit Card</span
                >
                <span class="material-icons-round">contactless</span>
            </div>
            <div class="flex flex-col gap-1">
                <span class="text-lg font-mono tracking-widest"
                      >**** **** **** 4582</span
                >
                <div class="flex justify-between items-end mt-2">
                    <div>
                        <span class="text-[10px] opacity-60 block"
                              >CARD HOLDER</span
                        >
                        <span class="text-sm font-medium">ALEX MORGAN</span>
                    </div>
                    <div class="flex flex-col items-end">
                        <span class="text-[10px] opacity-60 block">EXPIRES</span>
                        <span class="text-sm">12/25</span>
                    </div>
                </div>
            </div>
            <div
                class="absolute bottom-5 right-5 font-bold italic text-xl opacity-80"
                >
                VISA
            </div>
        </div>
        <button
            class="w-full mt-4 py-2 border border-dashed border-gray-300 dark:border-gray-600 rounded-lg text-sm text-muted-light dark:text-muted-dark hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors flex items-center justify-center gap-2"
            >
            <span class="material-icons-round text-base">add</span> Add New
            Card
        </button>
    </div>
    <div
        class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl shadow-soft border border-gray-100 dark:border-gray-700"
        >
        <div class="flex justify-between items-center mb-4">
            <h2
                class="text-lg font-semibold text-text-light dark:text-text-dark"
                >
                Anggaran

            </h2>
        </div>

        <%
            List<Anggaran> anggaranList
                    = (List<Anggaran>) request.getAttribute("listAnggaran");

//            out.println("DEBUG SIZE: "
//                    + (anggaranList == null ? "NULL" : anggaranList.size()));
        %>



        <div class="space-y-6">
            <%
                if (anggaranList != null && !anggaranList.isEmpty()) {
                    for (Anggaran a : anggaranList) {

                        BigDecimal total = a.getJumlahAnggaran();
                        BigDecimal sisa = a.getSisaAnggaran();

                        if (total == null || total.compareTo(BigDecimal.ZERO) == 0) {
            %>
            DEBUG TOTAL: <%= total%> | SISA: <%= sisa%><br>
            <%
                    continue; // skip data rusak
                }

                BigDecimal terpakai = total.subtract(sisa);

                int persen = terpakai
                        .multiply(new BigDecimal(100))
                        .divide(total, 0, RoundingMode.HALF_UP)
                        .intValue();
            %>

            <div class="bg-surface-light dark:bg-surface-dark p-3 rounded-xl shadow-soft">
                <div class="flex justify-between items-center text-sm mb-2">
                    <span class="font-medium">
                        <%= a.getKategori().getNamaKategori()%>
                    </span>
                    <span class="text-xs text-muted-light dark:text-muted-dark">
                        Rp <%= terpakai%> / Rp <%= total%>
                    </span>
                </div>

                <div class="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2 overflow-hidden">
                    <div class="bg-primary h-2 rounded-full transition-all duration-300"
                         style="width: <%= Math.min(persen, 100)%>%">
                    </div>
                </div>

                <div class="mt-1 text-xs text-muted-light dark:text-muted-dark text-right">
                    <%= persen%>% terpakai
                </div>
            </div>

            <%
                }
            } else {
            %>

            <div class="text-sm text-muted-light dark:text-muted-dark">
                Belum ada data anggaran
            </div>

            <%
                }
            %>
        </div>
    </div>
    <div
        class="bg-surface-light dark:bg-surface-dark p-6 rounded-xl shadow-soft border border-gray-100 dark:border-gray-700"
        >
        <h2
            class="text-lg font-semibold text-text-light dark:text-text-dark mb-4"
            >
            Quick Transfer
        </h2>
        <div class="flex gap-2 overflow-x-auto pb-2 mb-4 no-scrollbar">
            <div
                class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer"
                >
                <div
                    class="w-12 h-12 rounded-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center hover:bg-gray-300 dark:hover:bg-gray-600 transition-colors"
                    >
                    <span
                        class="material-icons-round text-muted-light dark:text-muted-dark"
                        >add</span
                    >
                </div>
                <span class="text-xs text-muted-light dark:text-muted-dark"
                      >New</span
                >
            </div>
            <div
                class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer group"
                >
                <img
                    alt="Sarah"
                    class="w-12 h-12 rounded-full border-2 border-transparent group-hover:border-primary transition-all object-cover"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuBTFW661gN7I8rKfpc5_U7Fq54vppnRu20YlSIWTJccF5-UQQdzYD8svoj6526xdrmAMoXg_LHP3LK6dPK3udv_SkOHVlof2ugr-BqYee6inV82mpDkzwp753YlgVBUmvQhoAFGHuzQFBsStDaxAETk_FpJwBAPxb4nseJQrgOTnkiwqq39785Ew8B-9KYWIdECwvGZXcjbjcw-aDgjkZHUqT0OjfAQtmEtjsdl1hQ1uxq248UiMtUpG_WCTOf4ay2wR-YJTFegx0bj"
                    />
                <span
                    class="text-xs text-text-light dark:text-text-dark font-medium"
                    >Sarah</span
                >
            </div>
            <div
                class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer group"
                >
                <img
                    alt="Mom"
                    class="w-12 h-12 rounded-full border-2 border-transparent group-hover:border-primary transition-all object-cover"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuCB--s9qtNWBDcWQRfp06ZofIrUBwJ3UPsyjC8k7YzV5kLo3UO84QX_TT83MjYTA3zO2D1jB4FikTa7p7IOrXZrvHkG58PD3AvpJaKZi2xeUQ7AVIuUuj4foOpFIZmHv3MMfBte0R5Y4Es6j2lrYs8v0RYZNGWMULEIBaEltIkDCyUBC2Px40mAUrmRkYm55zhjD2Bnt2eKn9WeyaWDPmB3CJvtAAYzke0xbV_PQKwFKpwWhE5aBuKg39LXToVyaQ-6R_mgXEmvIIt2"
                    />
                <span
                    class="text-xs text-text-light dark:text-text-dark font-medium"
                    >Mom</span
                >
            </div>
            <div
                class="flex flex-col items-center gap-1 min-w-[60px] cursor-pointer group"
                >
                <img
                    alt="Mike"
                    class="w-12 h-12 rounded-full border-2 border-transparent group-hover:border-primary transition-all object-cover"
                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuCx_uJ2GaCw7aDPbOtZRbVow6Yrva_yBilqXmeKrNJ-rwh6mG-KHQ5dLmjSrkakeNZeuPKcGUAh36iKHsMaB_j_xALpWuM5aYF52xmDqKSabXFRwYY2jLpMUvf52ziw4dIYhijVMUPkNQI7LH_hi4SpT0X55jzaIRoG6trOvxALOGHYOWV94YSvCecIjjUsg-fqevJp3c84f9cgF1sALr8oIHjEeL5xdu0pYaoB0rr0OLsCOG4Ptlip4GxsWAm4XjhWmXjYffDuki6J"
                    />
                <span
                    class="text-xs text-text-light dark:text-text-dark font-medium"
                    >Mike</span
                >
            </div>
        </div>
        <div class="relative">
            <span
                class="absolute left-3 top-2.5 text-muted-light dark:text-muted-dark"
                >$</span
            >
            <input
                class="w-full pl-7 pr-12 py-2 bg-gray-50 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-sm focus:ring-primary focus:border-primary"
                placeholder="0.00"
                type="number"
                />
            <button
                class="absolute right-1 top-1 bg-primary hover:bg-primary-dark text-white px-3 py-1.5 rounded-md text-xs font-medium transition-colors"
                >
                Send
            </button>
        </div>
    </div>
</aside>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cards</title>
    <style>
        .card-list { display: flex; flex-wrap: wrap; gap: 20px; }
        .card-item { 
            border: 1px solid #ccc; 
            padding: 20px; 
            border-radius: 10px; 
            width: 300px;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
        }
        .add-card-form { margin-top: 30px; padding: 20px; border: 1px solid #eee; }
    </style>
</head>
<body>
    <h1>My Cards</h1>
    
    <div class="card-list">
        <c:forEach var="kartu" items="${listKartu}">
            <div class="card-item">
                <h3>${kartu.namaKartu} (${kartu.jenisKartu})</h3>
                <p>${kartu.nomorKartuMasked}</p>
                <p>Pemilik: ${kartu.namaPemilik}</p>
                <p>Bank: ${kartu.bank}</p>
                <c:if test="${not empty kartu.tanggalExp}">
                    <p>Exp: ${kartu.tanggalExp}</p>
                </c:if>
                <form action="kartu" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="hapus">
                    <input type="hidden" name="id_kartu" value="${kartu.idKartu}">
                    <button type="submit">Hapus</button>
                </form>
            </div>
        </c:forEach>
    </div>

    <div class="add-card-form">
        <h3>+ Tambah Kartu Baru</h3>
        <form action="kartu" method="post">
            <input type="hidden" name="action" value="tambah">
            
            Jenis Kartu:
            <select name="jenis" required>
                <option value="debit">Debit</option>
                <option value="kredit">Kredit</option>
            </select><br><br>
            
            Nama Kartu: <input type="text" name="nama_kartu" required><br><br>
            Nomor Kartu (masked): <input type="text" name="nomor_masked" placeholder="**** **** **** 1234" required><br><br>
            Nama Pemilik: <input type="text" name="nama_pemilik" required><br><br>
            Bank: <input type="text" name="bank"><br><br>
            Tanggal Exp (opsional): <input type="date" name="tanggal_exp"><br><br>
            
            <button type="submit">Simpan Kartu</button>
        </form>
    </div>
    
    <br>
    <a href="dashboard.jsp">Kembali ke Dashboard</a>
</body>
</html>
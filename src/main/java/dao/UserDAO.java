/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Role;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private final Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    /**
     * Cari user berdasarkan username. Digunakan untuk login & session restore.
     */
    public User findByUsername(String username) throws Exception {
        String sql
                = "SELECT "
                + "  u.id_user, "
                + "  u.username, "
                + "  u.password_hash, "
                + "  u.nama_lengkap, "
                + "  u.email, "
                + "  u.created_at, "
                + "  r.id_role, "
                + "  r.nama_role "
                + "FROM users u "
                + "JOIN roles r ON u.id_role = r.id_role "
                + "WHERE u.username = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Role role = new Role(
                        rs.getInt("id_role"),
                        rs.getString("nama_role")
                );

                return new User(
                        rs.getInt("id_user"),
                        rs.getString("username"),
                        rs.getString("password_hash"),
                        rs.getString("nama_lengkap"),
                        rs.getString("email"),
                        role,
                        rs.getTimestamp("created_at")
                );
            }
        }
        return null;
    }

    /**
     * Login logic (BCrypt verification). PASSWORD TIDAK PERNAH dibandingkan
     * plaintext.
     */
    public User authenticate(String username, String plainPassword) throws Exception {
        User user = findByUsername(username);

        if (user == null) {
            return null;
        }

        if (BCrypt.checkpw(plainPassword, user.getPasswordHash())) {
            return user;
        }

        return null;
    }

    /**
     * Ambil user by ID (untuk restore session).
     */
    public User findById(int idUser) throws Exception {
        String sql
                = "SELECT "
                + "  u.id_user, "
                + "  u.username, "
                + "  u.password_hash, "
                + "  u.nama_lengkap, "
                + "  u.email, "
                + "  u.created_at, "
                + "  r.id_role, "
                + "  r.nama_role "
                + "FROM users u "
                + "JOIN roles r ON u.id_role = r.id_role "
                + "WHERE u.id_user = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Role role = new Role(
                        rs.getInt("id_role"),
                        rs.getString("nama_role")
                );

                return new User(
                        rs.getInt("id_user"),
                        rs.getString("username"),
                        rs.getString("password_hash"),
                        rs.getString("nama_lengkap"),
                        rs.getString("email"),
                        role,
                        rs.getTimestamp("created_at")
                );
            }
        }
        return null;
    }

    /**
     * GANTI PASSWORD USER 
     * 1. Verifikasi password lama dengan BCrypt 
     * 2. Hash password baru dengan BCrypt 
     * 3. Update ke database
     */
    public boolean changePassword(int idUser, String currentPlainPassword, String newPlainPassword) throws Exception {
        // 1. Verifikasi password saat ini
        User user = findById(idUser);
        if (user == null) {
            return false;
        }

        // Verifikasi password lama dengan BCrypt
        if (!BCrypt.checkpw(currentPlainPassword, user.getPasswordHash())) {
            return false;
        }

        // 2. Hash password baru dengan BCrypt
        String newPasswordHash = BCrypt.hashpw(newPlainPassword, BCrypt.gensalt());

        // 3. Update ke database
        String sql = "UPDATE users SET password_hash = ? WHERE id_user = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPasswordHash);
            ps.setInt(2, idUser);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    /**
     * Verifikasi password saat ini saja (untuk validasi di form)
     */
    public boolean verifyCurrentPassword(int idUser, String currentPlainPassword) throws Exception {
        User user = findById(idUser);
        if (user == null) {
            return false;
        }
        return BCrypt.checkpw(currentPlainPassword, user.getPasswordHash());
    }

    /**
     * Update profil user (nama lengkap dan email)
     */
    public boolean updateProfile(int idUser, String namaLengkap, String email) throws Exception {
        String sql = "UPDATE users SET nama_lengkap = ?, email = ? WHERE id_user = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, namaLengkap);
            ps.setString(2, email);
            ps.setInt(3, idUser);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    /**
     * Cek apakah username sudah ada (untuk registrasi)
     */
    public boolean isUsernameExists(String username) throws Exception {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    /**
     * Cek apakah email sudah ada (untuk registrasi)
     */
    public boolean isEmailExists(String email) throws Exception {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    /**
     * Registrasi user baru
     * @return ID user yang baru dibuat, atau -1 jika gagal
     */
    public int registerUser(String username, String plainPassword, String namaLengkap, String email) throws Exception {
        // 1. Cek apakah username sudah ada
        if (isUsernameExists(username)) {
            throw new Exception("Username sudah digunakan");
        }

        // 2. Cek apakah email sudah ada
        if (isEmailExists(email)) {
            throw new Exception("Email sudah terdaftar");
        }

        // 3. Hash password dengan BCrypt
        String passwordHash = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

        // 4. Default role = User (asumsi id_role = 2, admin = 1)
        int defaultRoleId = 2;

        String sql = "INSERT INTO users (username, password_hash, nama_lengkap, email, id_role) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, username);
            ps.setString(2, passwordHash);
            ps.setString(3, namaLengkap);
            ps.setString(4, email);
            ps.setInt(5, defaultRoleId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Ambil ID yang baru dibuat
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
            return -1;
        }
    }
}
//test
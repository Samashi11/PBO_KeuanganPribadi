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
}
//test
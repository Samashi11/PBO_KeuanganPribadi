/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

public class RoleDAO {

    private final Connection conn;

    public RoleDAO(Connection conn) {
        this.conn = conn;
    }

    public Role findById(int idRole) throws Exception {
        String sql = "SELECT id_role, nama_role FROM roles WHERE id_role = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idRole);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Role(
                        rs.getInt("id_role"),
                        rs.getString("nama_role")
                );
            }
        }
        return null;
    }

    public Role findByName(String namaRole) throws Exception {
        String sql = "SELECT id_role, nama_role FROM roles WHERE nama_role = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, namaRole);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Role(
                        rs.getInt("id_role"),
                        rs.getString("nama_role")
                );
            }
        }
        return null;
    }

    public void updateProfile(User user) throws SQLException {

        String sql = "UPDATE users SET nama_lengkap = ?, email = ? WHERE id_user = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getNamaLengkap());
            ps.setString(2, user.getEmail());
            ps.setInt(3, user.getIdUser());
            ps.executeUpdate();
        }
    }
}

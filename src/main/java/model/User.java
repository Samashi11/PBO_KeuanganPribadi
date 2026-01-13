/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

public class User {

    private int idUser;
    private String username;
    private String passwordHash;
    private String namaLengkap;
    private String email;

    // Relasi
    private Role role;

    private Timestamp createdAt;

    // Constructor kosong (JavaBean)
    public User() {
    }

    // Constructor minimal (misal untuk login result)
    public User(int idUser, String username) {
        this.idUser = idUser;
        this.username = username;
    }

    // Constructor lengkap (AMAN & SELARAS DB)
    public User(int idUser, String username, String passwordHash,
            String namaLengkap, String email,
            Role role, Timestamp createdAt) {
        this.idUser = idUser;
        this.username = username;
        this.passwordHash = passwordHash;
        this.namaLengkap = namaLengkap;
        this.email = email;
        this.role = role;
        this.createdAt = createdAt;
    }

    // ===== Getter & Setter =====
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getNamaLengkap() {
        return namaLengkap;
    }

    public void setNamaLengkap(String namaLengkap) {
        this.namaLengkap = namaLengkap;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    // ❗ biasanya tidak perlu setter createdAt,
    // tapi tetap disediakan agar mapping DAO fleksibel
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}

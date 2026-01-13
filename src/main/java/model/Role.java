/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Role {

    private int idRole;
    private String namaRole;

    // Constructor kosong (JavaBean)
    public Role() {
    }

    // Constructor lengkap
    public Role(int idRole, String namaRole) {
        this.idRole = idRole;
        this.namaRole = namaRole;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public String getNamaRole() {
        return namaRole;
    }

    public void setNamaRole(String namaRole) {
        this.namaRole = namaRole;
    }
}

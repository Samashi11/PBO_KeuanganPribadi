package model;

public class RegisterRequest {
    private String username;
    private String password;
    private String confirmPassword;
    private String namaLengkap;
    private String email;
    
    // Constructors
    public RegisterRequest() {}
    
    public RegisterRequest(String username, String password, String confirmPassword, String namaLengkap, String email) {
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.namaLengkap = namaLengkap;
        this.email = email;
    }
    
    // Getters and Setters
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getConfirmPassword() {
        return confirmPassword;
    }
    
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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
}
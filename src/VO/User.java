package VO;

public class User {
    private String UserID;
    private String Password;
    private String Phone;
    private String Email;
    private String ResistTime;
    private String Level;

    public String getLevel() {
        return Level;
    }

    public void setLevel(String level) {
        Level = level;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getResistTime() {
        return ResistTime;
    }

    public void setResistTime(String resistTime) {
        ResistTime = resistTime;
    }
}

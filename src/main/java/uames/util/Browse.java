package uames.util;

import java.util.Date;

public class Browse {
    private String id;
    private long userID;
    private String iconCode;
    private Date iconCodeLife;
    private String password;	// 密码
    
 
 
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public long getUserID() {
        return userID;
    }
    public void setUserID(long userID) {
        this.userID = userID;
    }
  
    public String getIconCode() {
        String _str = null;
        if(iconCodeLife != null){
            Long curtime = new Date().getTime();
            Long oldtime = iconCodeLife.getTime();

            if(oldtime + 10 * 60 * 1000 > curtime)
                _str = iconCode;
        }
        return _str;
    }
    public void setIconCode(String iconCode) {
        this.iconCode = iconCode;
    }
    public Date getIconCodeLife() {
        return iconCodeLife;
    }
    public void setIconCodeLife(Date iconCodeLife) {
        this.iconCodeLife = iconCodeLife;
    }
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}

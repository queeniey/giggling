package uames.po;



public class User extends Base  {
	/**
	 * 用户名
	 */
	private String account;
	/**
	 * 密码
	 */
	private String password;
    public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}

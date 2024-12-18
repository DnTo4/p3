package es.uco.practica3.display;

public class CustomerBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String emailUser = "";
	//private String password = "";

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	
	/*public String getPassword()
	{
		return this.password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}*/
}
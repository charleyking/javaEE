package club.charleyking.model;

public class User {
	private int id = 0;
	private String userName = "";
	private String password = "";
	private String email = "";
	private String question = "";
	private String answer = "";
	private String city = "";
	
	public int getId() {
		return id;
	}
	public String getUserName() {
		return userName;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public String getQuestion() {
		return question;
	}
	public String getAnswer() {
		return answer;
	}
	public String getCity() {
		return city;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public void setCity(String city) {
		this.city = city;
	}
}

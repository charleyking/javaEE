package charleyking.club;

public class Person {
	private String name;
	private String sex;
	private int age;
	private String address;
	
	public Person() {
	}
	
	public String getName() {
		return name;
	}
	public String getSex() {
		return sex;
	}
	public int getAge() {
		return age;
	}
	public String getAddress() {
		return address;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}

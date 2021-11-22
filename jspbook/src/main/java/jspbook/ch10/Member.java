package jspbook.ch10;

public class Member {
	
	private String name;
	private String email;
	
	public Member(String name, String email) {
		this.name = name;
		this.email = email;
	}
	
	public Member() {
		name="디폴트";
		email="default@kpu.ac.kr";
	}
	
	public String getName() {return name;}
	public String getEmail() {return email;}
	
	public void setName(String name) {this.name = name;}
	public void setEmail(String email) {this.email = email;}

}


package com.medical.dto;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String postcode;
	private String addr;
	private String detailAddress;
	private String extraAddress;
	private String tel;
	private String birth;
	private String email;
	private String grade;

	public MemberDto() {}

//	public MemberDto(String id, String pw) {
//		this.id = id;
//		this.pw = pw;
//	}

//	public MemberDto(String id, String pw, String name, String addr, String tel, int birth, String email) {
//		this.id = id;
//		this.pw = pw;
//		this.name = name;
//		this.addr = addr;
//		this.tel = tel;
//		this.birth = birth;
//		this.email = email;
//	}
	
	
	public MemberDto(String id, String pw, String name, String postcode, String addr, String detailAddress,
			String extraAddress, String tel, String birth, String email) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.postcode = postcode;
		this.addr = addr;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
		this.tel = tel;
		this.birth = birth;
		this.email = email;
	}
	
	public MemberDto(String name, String email) {
		this.name = name;
		this.email = email;
	}

	public MemberDto(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
		
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", name=" + name + ", postcode=" + postcode + ", addr=" + addr
				+ ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + ", tel=" + tel + ", birth="
				+ birth + ", email=" + email + ", grade=" + grade + "]";
	}
	
	
	
}

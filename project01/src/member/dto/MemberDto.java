package member.dto;

import java.util.Date;

public class MemberDto {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_gender;
	private String mem_addr;
	private String mem_phone;
	private String mem_email;
	private Date mem_adddate;
	private String mem_enabled;
	private int mem_role;
	
	public MemberDto() {
		
	}

	public MemberDto(String mem_id, String mem_pw, String mem_name, String mem_gender, String mem_addr,
			String mem_phone, String mem_email, Date mem_adddate, String mem_enabled, int mem_role) {
	
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_addr = mem_addr;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_adddate = mem_adddate;
		this.mem_enabled = mem_enabled;
		this.mem_role = mem_role;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public Date getMem_adddate() {
		return mem_adddate;
	}

	public void setMem_adddate(Date mem_adddate) {
		this.mem_adddate = mem_adddate;
	}

	public String getMem_enabled() {
		return mem_enabled;
	}

	public void setMem_enabled(String mem_enabled) {
		this.mem_enabled = mem_enabled;
	}

	public int getMem_role() {
		return mem_role;
	}

	public void setMem_role(int mem_role) {
		this.mem_role = mem_role;
	}
	
}

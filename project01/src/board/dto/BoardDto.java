package board.dto;

import java.util.Date;

public class BoardDto {
	
	private int boa_seq;
	private String mem_id;
	private String boa_title;
	private String boa_content;
	private int boa_cnt;
	private Date regdate;
	private int boa_category;
	private String boa_image;
	
	
	public BoardDto() {

	}


	public BoardDto(int boa_seq, String mem_id, String boa_title, String boa_content, int boa_cnt, Date regdate,
			int boa_category, String boa_image) {
	
		this.boa_seq = boa_seq;
		this.mem_id = mem_id;
		this.boa_title = boa_title;
		this.boa_content = boa_content;
		this.boa_cnt = boa_cnt;
		this.regdate = regdate;
		this.boa_category = boa_category;
		this.boa_image = boa_image;
	}


	public int getBoa_seq() {
		return boa_seq;
	}


	public void setBoa_seq(int boa_seq) {
		this.boa_seq = boa_seq;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getBoa_title() {
		return boa_title;
	}


	public void setBoa_title(String boa_title) {
		this.boa_title = boa_title;
	}


	public String getBoa_content() {
		return boa_content;
	}


	public void setBoa_content(String boa_content) {
		this.boa_content = boa_content;
	}


	public int getBoa_cnt() {
		return boa_cnt;
	}


	public void setBoa_cnt(int boa_cnt) {
		this.boa_cnt = boa_cnt;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getBoa_category() {
		return boa_category;
	}


	public void setBoa_category(int boa_category) {
		this.boa_category = boa_category;
	}


	public String getBoa_image() {
		return boa_image;
	}


	public void setBoa_image(String boa_image) {
		this.boa_image = boa_image;
	}

	
	
	
}

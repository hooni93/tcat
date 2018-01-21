package spring.project.tcat.VO;

public class NoticeVO {
	//게시판
	
	int notice_num; //번호 (PK)
	String notice_title; //제목
	String wirte_Date; //작성일
	int refNum; //조회수
	String contents; //내용
	String notice_image; //이미지
	String notice_addfile; //첨부파일
	int notice_div; //구분번호
	String member_id; //작성자(FK)
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getWirte_Date() {
		return wirte_Date;
	}
	public void setWirte_Date(String wirte_Date) {
		this.wirte_Date = wirte_Date;
	}
	public int getRefNum() {
		return refNum;
	}
	public void setRefNum(int refNum) {
		this.refNum = refNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}
	public String getNotice_addfile() {
		return notice_addfile;
	}
	public void setNotice_addfile(String notice_addfile) {
		this.notice_addfile = notice_addfile;
	}
	public int getNotice_div() {
		return notice_div;
	}
	public void setNotice_div(int notice_div) {
		this.notice_div = notice_div;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}

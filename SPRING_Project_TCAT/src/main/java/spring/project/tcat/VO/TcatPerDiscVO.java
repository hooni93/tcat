package spring.project.tcat.VO;

public class TcatPerDiscVO {
	
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////

	int disc_code; 			//상품코드
	String disc_title;		//상품이름
	int disc_price; 		//가격
	String disc_image;		//이미지
	String disc_con;		//상품설명
	String sale_div;		//할인조건
	int sale_rate; 			//할인율
	int cateNum; 			//카테고리 넘버
	String category; 		//카테고리
	String mDev;			//중분류
	String sDev;			//소분류
	String first_grade;		//우선순위
	String disc_step;		//상품스텝
	
	
	public String getDisc_step() {
		return disc_step;
	}
	public void setDisc_step(String disc_step) {
		this.disc_step = disc_step;
	}
	public String getDisc_title() {
		return disc_title;
	}
	public void setDisc_title(String disc_title) {
		this.disc_title = disc_title;
	}
	public int getDisc_code() {
		return disc_code;
	}
	public void setDisc_code(int disc_code) {
		this.disc_code = disc_code;
	}
	public int getDisc_price() {
		return disc_price;
	}
	public void setDisc_price(int disc_price) {
		this.disc_price = disc_price;
	}
	public String getDisc_image() {
		return disc_image;
	}
	public void setDisc_image(String disc_image) {
		this.disc_image = disc_image;
	}
	public String getDisc_con() {
		return disc_con;
	}
	public void setDisc_con(String disc_con) {
		this.disc_con = disc_con;
	}
	public String getSale_div() {
		return sale_div;
	}
	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getmDev() {
		return mDev;
	}
	public void setmDev(String mDev) {
		this.mDev = mDev;
	}
	public String getsDev() {
		return sDev;
	}
	public void setsDev(String sDev) {
		this.sDev = sDev;
	}
	public String getFirst_grade() {
		return first_grade;
	}
	public void setFirst_grade(String first_grade) {
		this.first_grade = first_grade;
	}
	
	//////////////////////////////////////18.01.11 명훈//////////////////////////////////////////////////
	
}

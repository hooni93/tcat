package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatPerformanceVO {

	int per_id; //공연번호
	String perf_title; //공연제목
	String cateNum; //카테고리구분번호
	String category; //카테고리
	String mdev; //중분류
	String sdev; //소분류
	String perf_Image; //공연이미지
	String sale_div; //할인조건
	int sale_rate; //할인율
	int detail_num; //상세페이지번호
	Timestamp startdate; //시작날짜
	Timestamp enddate; //종료날짜
	int place_num; //공연지역번호
	String province; //공연지역(도)
	String city; //공연지역(시)
	String gu; //공연지역(구)
	String address; //공연지역(상세주소)
	String first_grade; //상품우선순위
	String per_step; //공연스텝
	
	
	public int getPer_id() {
		return per_id;
	}
	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}
	public String getPerf_title() {
		return perf_title;
	}
	public void setPerf_title(String perf_title) {
		this.perf_title = perf_title;
	}
	public String getCateNum() {
		return cateNum;
	}
	public void setCateNum(String cateNum) {
		this.cateNum = cateNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMdev() {
		return mdev;
	}
	public void setMdev(String mdev) {
		this.mdev = mdev;
	}
	public String getSdev() {
		return sdev;
	}
	public void setSdev(String sdev) {
		this.sdev = sdev;
	}
	public String getPerf_Image() {
		return perf_Image;
	}
	public void setPerf_Image(String perf_Image) {
		this.perf_Image = perf_Image;
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
	public int getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(int detail_num) {
		this.detail_num = detail_num;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	public Timestamp getEnddate() {
		return enddate;
	}
	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}
	public int getPlace_num() {
		return place_num;
	}
	public void setPlace_num(int place_num) {
		this.place_num = place_num;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFirst_grade() {
		return first_grade;
	}
	public void setFirst_grade(String first_grade) {
		this.first_grade = first_grade;
	}
	public String getPer_step() {
		return per_step;
	}
	public void setPer_step(String per_step) {
		this.per_step = per_step;
	}
	
/*
공연정보 가져오기  sql문-------------------------------------------------------------------------

    select pe.PER_ID,pe.PERF_TITLE,pe.CATENUM,ca.CATEGORY,ca.mDev,ca.sdev,pe.perf_image,pe.sale_div,
           s.SALE_RATE,pe.DETAIL_NUM,
           pe.STARTDATE,pe.ENDDATE,pla.PROVINCE,pla.CITY,pla.gu,pla.address,pe.first_grade ,rownum rNum
    from performanceInfo pe, place pla, category ca,sale s
    where pe.province = pla.PROVINCE and pe.CATENUM = ca.CATENUM and pe.sale_div=s.SALE_DIV

--------------------------------------------------------------------------------------------------------*/
	
}
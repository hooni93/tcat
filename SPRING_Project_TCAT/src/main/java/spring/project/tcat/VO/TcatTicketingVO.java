package spring.project.tcat.VO;

import java.sql.Timestamp;

public class TcatTicketingVO {
	
	/*
		<Ticketing>
			ticket_num     NUMBER(20)       NOT NULL, 
		    member_id      VARCHAR2(50)     NOT NULL, 
		    per_id         NUMBER(20)       NOT NULL, 
		    ticet_date     TIMESTAMP        DEFAULT SYSDATE, 
		    seat_type       VARCHAR2(20)       DEFAULT '0', 
		    seat_num       VARCHAR2(150)    DEFAULT '0', 
		    sale_div       VARCHAR2(50)     NOT NULL, 
		    del_num        NUMBER(20)       NOT NULL, 
		    ticket_step    NUMBER(20)       DEFAULT 0, 
		    
		 <sale>
		 	sale_div     VARCHAR2(50)    NOT NULL, 
    		sale_rate    NUMBER(10)      NOT NULL, 
    		
    	<delevaryInfo>
    		del_num     NUMBER(20)       NOT NULL, 
		    del_name    VARCHAR2(50)     NOT NULL, 
		    del_addr    VARCHAR2(255)    NOT NULL, 
		    del_hp      VARCHAR2(50)     NOT NULL, 
	*/
	
	//<Ticketing>
	int 		ticket_num;			//예매번호
    String 		member_id;			//예매자 아이디
    int 		per_id; 			//공연 번호
    Timestamp 	ticet_date;			//공연날짜
    String  	seat_type;			//좌석 타입
    String 		seat_num;			//좌석번호
    String 		sale_div;			//할인조건
    int 		del_num;			//배송번호
    int 		ticket_step;		//예매스텝
    //<sale>
 	int 		sale_rate; 			//할인률
	//<delevaryInfo>
 	String 		del_name;			//이름
 	String 		del_addr;			//주소
 	String 		del_hp;				//연락처
 	
 	//태성이가 한거^^
 	String perf_title;
 	int round;
 	
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public String getPerf_title() {
		return perf_title;
	}
	public void setPerf_title(String perf_title) {
		this.perf_title = perf_title;
	}
	public int getTicket_num() {
		return ticket_num;
	}
	public void setTicket_num(int ticket_num) {
		this.ticket_num = ticket_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPer_id() {
		return per_id;
	}
	public void setPer_id(int per_id) {
		this.per_id = per_id;
	}
	public Timestamp getTicet_date() {
		return ticet_date;
	}
	public void setTicet_date(Timestamp ticet_date) {
		this.ticet_date = ticet_date;
	}
	public String getSeat_type() {
		return seat_type;
	}
	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public String getSale_div() {
		return sale_div;
	}
	public void setSale_div(String sale_div) {
		this.sale_div = sale_div;
	}
	public int getDel_num() {
		return del_num;
	}
	public void setDel_num(int del_num) {
		this.del_num = del_num;
	}
	public int getTicket_step() {
		return ticket_step;
	}
	public void setTicket_step(int ticket_step) {
		this.ticket_step = ticket_step;
	}
	public int getSale_rate() {
		return sale_rate;
	}
	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}
	public String getDel_name() {
		return del_name;
	}
	public void setDel_name(String del_name) {
		this.del_name = del_name;
	}
	public String getDel_addr() {
		return del_addr;
	}
	public void setDel_addr(String del_addr) {
		this.del_addr = del_addr;
	}
	public String getDel_hp() {
		return del_hp;
	}
	public void setDel_hp(String del_hp) {
		this.del_hp = del_hp;
	}
 	
 	
 	
}

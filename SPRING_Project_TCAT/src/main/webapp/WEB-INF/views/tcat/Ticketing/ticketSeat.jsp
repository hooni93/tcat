<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.project.tcat.VO.TcatPerformanceVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/tcatProject/tcat.git
		<div class="row baaaaaa">
	
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h4>좌석확인</h4>
			<hr>
		</div>
	
	</div>
	 <div class="row bf5f5f5">
	<div class="col-md-12 c pt30 thumbnail ">
	<%
	
	    ArrayList<TcatPerformanceVO> dtos=(ArrayList<TcatPerformanceVO>)request.getAttribute("dtos");
		String seat_line=dtos.get(0).getSeat_line();
		String[] seat_lineArr=seat_line.split("_");
		int seatRow=Integer.parseInt(seat_lineArr[0]);
		int seatColumn=Integer.parseInt(seat_lineArr[1]);
		Map<String,Object> map=new HashMap<String,Object>();
	for(int d=0;d<dtos.size();d++){
		map.put("seatnum",dtos.get(d).getSeat_num());
		map.put("seattype",dtos.get(d).getSeat_type());
		String vip=null;
		String r=null;
		String s=null;
		String a=null;
		String b=null;
		vip=dtos.get(d).getVIP_seat();
		r=dtos.get(d).getR_seat();
		s=dtos.get(d).getS_seat();
		a=dtos.get(d).getA_seat();
		b=dtos.get(d).getB_seat();
		String[] vipArr=null;
		String[] rArr=null;
		String[] sArr=null;
		String[] aArr=null;
		String[] bArr=null;
		if(vip!=null) {
			vipArr=vip.split("/");
		}
		if(r!=null){
			rArr=r.split("/");			
		}
		if(s!=null){		
			sArr=s.split("/");
		}
		if(a!=null){
			aArr=a.split("/");					
		}
		if(b!=null){
			bArr=b.split("/");					
		}
		for(int i=0;i<=seatRow;i++){
			for(int j=0;j<=seatColumn;j++){ 
				%>
				&nbsp;<input type="button" name="<%=i%>-<%=j%>" 
				<%
					String check=i+"-"+j;
					int checkNum=0;
				if( vip != null && checkNum==0 ){
						for(int k=0; k < vipArr.length;k++){
							if(vipArr[k].equals(check)){
								checkNum=1;
								 if(map.containsValue("VIP") && map.containsValue(vipArr[k])){
								 %> class="myButtonVIP m1 w40" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonVIP m1 w40" value="VIP.<%=check%>"><% 									 
								 }
							}
						}
					}
				if( r != null && checkNum==0 ){
						for(int k=0; k < rArr.length;k++){
							if(rArr[k].equals(check)){
								checkNum=1;
								 if(map.containsValue("R") && map.containsValue(rArr[k])){
									 %> class="myButtonR m1 w40" value="X" disabled><% 									 									 
									 }else{
									 %> class="myButtonR m1 w40" value="R.<%=check%>"><% 
							
									 }
							}
						}
					}
				if( s != null && checkNum==0 ){
						for(int k=0; k < sArr.length;k++){
							if(sArr[k].equals(check)){
								checkNum=1;
								  if(map.containsValue("S") && map.containsValue(sArr[k])){
								 %> class="myButtonS m1 w40" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonS m1 w40" value="S.<%=check%>"><% 
							}
						}
					}
				}
				if( a != null && checkNum==0 ){
						for(int k=0; k < aArr.length;k++){
							if(aArr[k].equals(check)){
								checkNum=1;
								  if(map.containsValue("A") && map.containsValue(aArr[k])){
										 %> class="myButtonA m1 w40" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w40" value="A.<%=check%>"><% 
							}
						}
					}
				}
				if( b != null && checkNum==0 ){
						for(int k=0; k < bArr.length;k++){
							if(bArr[k].equals(check)){
								checkNum=1;
								  if(map.containsValue("B") && map.containsValue(bArr[k])){
										 %> class="myButtonA m1 w40" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w40" value="B.<%=check%>"><% 
							}
						}
					}
				}
				if(checkNum==0) {
					%> class="myButtonNO m1 w40" value="<%=check%>" disabled>
			<% }
				
		}
			%><br> <%
	}
}%>
		</div> 
<<<<<<< HEAD
	</div>
=======
	</div>
>>>>>>> branch 'master' of https://github.com/tcatProject/tcat.git

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="spring.project.tcat.VO.TcatPerformanceVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){ 
    $('.checkButton').click(function(e){
    	var id="#";
        id +=e.target.getAttribute('id');
        if ( ( id != '') && (id != null))  
    	var active = $(id).hasClass("active");
     	if(active){
    		 $(id).removeClass("active");
    		 $(id).removeClass("selected");
    		 var idvalue=$("input[name='seat_type']").val();
    		 var idArr=idvalue.split(",");   
    		 if(idArr.length==1){
    			 $("input[name='seat_type']").val("0");
       		 }else{
    	   	idvalue="";
    	   	var idclick=$(id).val();
     	   	 for(var i=0;i<idArr.length;i++){
    	   		 if(idArr[i]!=idclick){
    	   			if(idvalue==""){
       	    		 idvalue=idArr[i];
       	    		 }else{	 
       	    			 idvalue+=","+idArr[i];
       	    		 } 	
    	   		 }
    		 } 
    	   	 $("input[name='seat_type']").val("");
    		 $("input[name='seat_type']").val(idvalue);
    		 }
    	}else{
    		 $(id).addClass("active");
    		 $(id).addClass("selected");
    		 var idvalue=$("input[name='seat_type']").val();
    		 if(idvalue==0){
    		 idvalue=$(id).val();
    		 }else{
    			 idvalue=$("input[name='seat_type']").val();
    			 idvalue+=","+$(id).val();
    		 } 		
    		 $("input[name='seat_type']").val(idvalue);
    	}  
    
    });
});






</script>
</head>
<body>

		<div class="row bf5f5f5">
	<div class="h25"></div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<h4>좌석확인</h4>
			<hr>
		</div>
	
	</div>
	 <div class="row bf5f5f5">
	<div class="col-md-12 c pt30 thumbnail ">
	<%
	
	    ArrayList<TcatPerformanceVO> dtos=null;
	    dtos=(ArrayList<TcatPerformanceVO>)request.getAttribute("dtos");
	    ArrayList<TcatPerformanceVO> dtos2=null;
	    dtos2=(ArrayList<TcatPerformanceVO>)request.getAttribute("dtos2");
		String seat_line=dtos.get(0).getSeat_line();
		String[] seat_lineArr=seat_line.split("_");
		int seatRow=Integer.parseInt(seat_lineArr[0]);
		int seatColumn=Integer.parseInt(seat_lineArr[1]);
		Map<String,Object> map=new HashMap<String,Object>();
		
		String vip=null;
		String r=null;
		String s=null;
		String a=null;
		String b=null;
		vip=dtos.get(0).getVIP_seat();
		r=dtos.get(0).getR_seat();
		s=dtos.get(0).getS_seat();
		a=dtos.get(0).getA_seat();
		b=dtos.get(0).getB_seat();

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
		if(dtos2!=null){
		for(int q=0;q<dtos2.size();q++){
			map.put(dtos.get(q).getSeat_num(),dtos.get(q).getSeat_type());
		}
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
								 if(dtos2!=null && map.containsValue("VIP") && map.containsKey(vipArr[k])){
								 %> class="myButtonVIP m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonVIP m1 w50 checkButton" id="<%=check%>" value="VIP.<%=check%>"><% 									 
								 }
							}
						}
					}
				if( r != null && checkNum==0 ){
						for(int k=0; k < rArr.length;k++){
							if(rArr[k].equals(check)){
								checkNum=1;
								 if(dtos2!=null && map.containsValue("R") && map.containsKey(rArr[k])){
									 %> class="myButtonR m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
									 }else{
									 %> class="myButtonR m1 w50 checkButton" id="<%=check%>" value="R.<%=check%>"><% 
							
									 }
							}
						}
					}
				if( s != null && checkNum==0 ){
						for(int k=0; k < sArr.length;k++){
							if(sArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("S") && map.containsKey(sArr[k])){
								 %> class="myButtonS m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
								 }else{
								 %> class="myButtonS m1 w50 checkButton" id="<%=check%>" value="S.<%=check%>"><% 
							}
						}
					}
				}
				if( a != null && checkNum==0 ){
						for(int k=0; k < aArr.length;k++){
							if(aArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("A") && map.containsKey(aArr[k])){
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="A.<%=check%>"><% 
							}
						}
					}
				}
				if( b != null && checkNum==0 ){
						for(int k=0; k < bArr.length;k++){
							if(bArr[k].equals(check)){
								checkNum=1;
								  if(dtos2!=null && map.containsValue("B") && map.containsKey(bArr[k])){
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="X" disabled><% 									 									 
										 }else{
										 %> class="myButtonA m1 w50 checkButton" id="<%=check%>" value="B.<%=check%>"><% 
							}
						}
					}
				}
				if(checkNum==0) {
					%> class="myButtonNO m1 w50 checkButton" id="<%=check%>" value="<%=check%>" disabled>
			<% }
				
		}
			%><br> <%
	}
%>
		</div> 
	</div>



</body>
</html>
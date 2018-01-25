<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>수령방법</th>
	</tr>
	<tr>
		<td>
			<table>
				<tr>
					<th>수령방법선택</th>
					<td>
						<input type="radio">현장수령
					</td>
					<td>
						<input type="radio">배송(2,500원)
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<th>주문자 확인<br><hr></th>
				</tr>
				<tr>
					<td>
						<div id="del">
							<!-- 주문자 확인 현장수령일때는 이름,연락처만 받고/배송일때는 주소까지 받는다. -->
						</div>
						<br>
					</td>				
					<td>
						<div style="border:1px solid #cccccc">
					   <pre>주의사항 * 부정확한 정보 입력으로 인한 문제 발생 시 tcat은 책임을 지지 않습니다.
							1)<span style="color:red">배송 선택 시 티켓 수령자의 배송지 정보를 정확히 입력해주시기 바랍니다.</span>
							2)<span style="color:red">티켓은 유가증권으로 본인에게 직접 전달해야 하며, 분실된 티켓은 재발권되지 않습니다.</span>
							3)<span style="color:red">일괄배송의 경우 정해진 날짜에 티켓 배송이 시작되며, 주소 수정은 일괄배송일 2일 전까지 가능합니다.</span>
							4)<span style="color:red">예매 티켓 배송은 예매완료일,혹은 일괄배송으로부터 4~5일(영업일 기준)이내 수령 가능합니다.</span>
							5)긴급연락처는 공연 공연 취소와 같은 유사 시 안내를 받으실 연락처이므로 정확히 입력해주시기 바랍니다.
							6)이메일 정보 미 입력 시 예매 관련 안내 메일을 받을 수 없으니 이메일 받기를 원하시는 경우 마이페이지에서
							    회원정보를 수정해주시기 바랍니다.</pre>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>

</table>
</body>
</html>
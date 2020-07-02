<%@page import="model.g2bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="index.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>나라장터</title>
</head>

<body>
	<br />
	<br />
	<div align="center">
		<h1>나라장터 공고조회</h1>
		<br />
		<form action="g2b">
			<table class="date">
				<tr>
					<td>From</td>
					<td>To</td>
				</tr>
				<tr>
					<td><input type="date" name="startDate" /> <input type="time"
						name="startTime" /></td>
					<td><input type="date" name="endDate" /> <input type="time"
						name="endTime" /></td>
				</tr>
			</table>
			<br /> <input type="submit" value="조회">
		</form>
	</div>

	<br />
	<br />
	<br />
	<br />
	<%
		String start = (String) request.getAttribute("start");
		String end = (String) request.getAttribute("end");
		String alSize = (String) request.getAttribute("alSize");
	%>
	<br />
	<table class="table">
		<thead>
				<%
					String date = "";
					if (start == null || end == null) {
						start = "";
						end = "";
					} else {
						date = start.substring(0, 4) + "." + start.substring(4, 6) + "." + start.substring(6, 8) + " "
								+ start.substring(8, 10) + ":" + start.substring(10, 12) + " ~ " + end.substring(0, 4) + "." + end.substring(4, 6) + "." + end.substring(6, 8) + " "
								+ end.substring(8, 10) + ":" + end.substring(10, 12);
					}
					if (alSize == null)
						alSize = "";
				%>
			<tr>
				<td>조회기간</td>
				<td><%=date%></td>
			</tr>
			<tr>
				<td>총 조회수</td>
				<td><%=alSize%></td>
			</tr>
		</thead>
	</table>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>공고 번호</th>
				<th>공고명</th>
				<th>공고 기관</th>
				<th>입찰 개시일자</th>
				<th>입찰 마감일자</th>
				<th>공고 예산</th>
				<th>주공종명</th>
			</tr>
		</thead>
		<tbody>

			<%
				ArrayList<g2bDTO> al = (ArrayList<g2bDTO>) request.getAttribute("al");

				if (al != null) {
					for (g2bDTO dto : al) {
						String bidNtceNo = dto.getBidNtceNo();
						String bidNtceNm = dto.getBidNtceNm();
						String ntceInsttNm = dto.getNtceInsttNm();
						String bidBeginDt = dto.getBidBeginDt();
						String bidClseDt = dto.getBidClseDt();
						String bdgtAmt = dto.getBdgtAmt();
						String mainCnsttyNm = dto.getMainCnsttyNm();
						String bidNtceDtlUrl = dto.getBidNtceDtlUrl();
			%>

			<tr>
				<td><%=bidNtceNo%></td>
				<td><a class="g2bLink" href="<%=bidNtceDtlUrl%>"><%=bidNtceNm%></a></td>
				<td><%=ntceInsttNm%></td>
				<td><%=bidBeginDt%></td>
				<td><%=bidClseDt%></td>
				<td><%=bdgtAmt%></td>
				<td><%=mainCnsttyNm%></td>
			</tr>

			<%
				}
				}
			%>

		</tbody>
	</table>
</body>

</html>
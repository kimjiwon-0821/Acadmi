<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>직원 계정 생성</h1>
	<form action="./administratorAdd" method="post">
		입학년도 <input type="text" name="username"> <br>
		비밀번호 <input type="text" name="password"><br>
		이메일 <input type="email"name="email" > <br>
		담당학과 
		<select name="deptNum">
			<option value="1">컴퓨터공학과</option>
		</select><br>
		이름 <input type="text" name="name"><br>
		전화번호 <input type="text" name="phone"><br>
		생년월일 <input type="text" name="birth"><br>
		주소 <input type="text" name="address"><br>
		<input type="hidden" name="category" value="0">
		
		<button type="submit">직원가입</button>
		 
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="css/regist.css">
<title>구매자 회원가입 페이지</title>
<style>
#test_btn1 {
  border: 0;
  outline: none;
  font-size: 30px;
  background: white;
  color: rgb(111,167,235);
  cursor: pointer;
  border: solid 1px rgb(111,167,235);
  box-sizing: border-box;
  width: 150px;
}
#test_btn2 {
  border: 0;
  outline: none;
  font-size: 30px;
  background: 1px rgb(111,167,235);
  color: white;
  cursor: pointer;

  width: 150px;
}

</style>
	<script>
	// 도메인 주소를 입력하는 함수
	function domainChange(d){
		var v=d.value;
		document.C_Registform.C_domain.value=v;
	}
	//1차,2차 비밀번호가 같은 확인 하는 함수
	function checkPwd(pwd1, pwd2){
		if(pwd1 === pwd2){
			return true;
		} else{
			return false;
		}
	}
	function confirmForm(){
		//console.log('확인');
		/*var id = document.C_Registform.id(요건 name하고 무조건 같다).value;*/
		var id = document.C_Registform.C_id.value;
		
		var pwd1 = document.C_Registform.C_pwd_1.value;
		var pwd2 = document.C_Registform.C_pwd_2.value;
		
		var Name = document.C_Registform.C_name.value;
		
		var phoneNum1 = document.C_Registform.first.value;
		var phoneNum2 = document.C_Registform.second.value;
		var phoneNum3 = document.C_Registform.third.value;
		
		var e_front = document.C_Registform.C_front.value;
		var e_domain = document.C_Registform.C_domain.value;
		
		var address = document.C_Registform.C_Address.value;
		
		if(!checkPwd(pwd1,pwd2)){
			alert("비밀번호 다시 입력해주세요");
			return false;
		}
		
		/* 모든 항목 중에 입력안한 곳이 있을 시 */
		if (!id || !pwd1 || !pwd2 || !Name || !phoneNum1 || !phoneNum2 || !phoneNum3 
				|| !e_front || !e_domain || !address) {
			alert('모든 항목을 입력해주세요!');
			return false;
		}
		else {
			
			return true;
		}
		
		
		
	}	
	
	</script>
</head>
<body>
	<center>
		<button id="test_btn1" onClick="location.href='delivery_registration.jsp'">납품자</button>
		<button id="test_btn1" onClick="location.href='admin_registration.jsp'">관리자</button>
		<button id="test_btn2">구매자</button>
		<br><br>
	
	<form name="C_Registform" action="customer_regist_ok.jsp" method="get" onSubmit="return confirmForm()">
		<table border="1" bordercolor="blue" width="50%" height="50px">
		<!-- 아이디 -->
		<tr><th class="info" align="center">아이디 </th>
			<td class="input_info" align="center">
				<input type = "text" name = "C_id" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 비밀번호 1차 -->
		<tr><th class="info" align="center">비밀번호 </th>
			<td class="input_info" align="center">
				<input type = "password" name = "C_pwd_1" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 비밀번호 2차 -->
		<tr><th class="info" align="center">비밀번호 </th>
			<td class="input_info" align="center">
				<input type = "password" name = "C_pwd_2" size="20" style="width: 445px;">
			</td>
		</tr>	
		<!-- 이름 -->
		<tr><th class="info" align="center">이름 </th>
			<td class="input_info" align="center">
				<input type = "text" name = "C_name" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 이메일 -->
		<tr><th class="info" align="center">이메일 </th>
			<td class="input_info" align="center">
				<input type="text" name="C_front"/>
				@<input type="text" name="C_domain">
					<select name=C_domain_input onchange="domainChange(this);">
						<option selected="selected" value="null">직접입력</option>
						<option value="naver.com"&gtnaver.com>naver.com</option>
						<option value="gmail.com"&gtnaver.com>gmail.com</option>
					</select>
			</td>
		</tr>
		<!-- 전화번호 -->
		<tr><th class="info" align="center">전화번호 </th>
			<td class="input_info" align="center">
				<select name="first">
					<option selected="selected" value="null">선택하세요.</option>
					<option>010</option>
					<option>051</option>
					<option>031</option>
				</select>
				<input type="text" name="second">
				<input type="text" name="third">
			</td>
		</tr>	
		<!-- 주소 -->
		<tr><th class="'=info" align="center">주소</th>
			<td class="input_info" align="center">
				<input type="text" name="C_Address" size="40" style="width: 445px;">
			</td>
		</tr>			
									
	</table>
	  <input type="submit" style="width:150px;height:50px;margin-left:auto;margin-right:auto" value="가입"/>
	</form>
	</center>
</body>
</html>
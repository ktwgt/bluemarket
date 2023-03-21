<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   section {
      width:1000px;
      height:700px;
      margin:auto;
   }
   section div {
     margin-top:12px;
   }
   section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid #4374D9; 
   }
   section textarea {
      width:330px;
      height:100px;
      border:1px solid #4374D9; 
      resize: none;
   }
   section input[type=password] {
      width:330px;
      height:35px;
      border:1px solid #4374D9; 
   }
   section #zip {
      width:210px;
      height:35px;
   }
   section #zipbtn {
      width:120px;
      height:39px;
      vertical-align:bottom;
      background:#4374D9;
      border:1px solid #4374D9; 
      color:white;
   }
   section #subbtn {
      width:336px;
      height:39px;
      border:1px solid #4374D9; 
      background:#4374D9;
      border:1px solid #4374D9; 
      color:white;
      cursor:pointer;
   }
 
 </style>
 <script> 

 function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	    
	  } 
	  else {
	    document.getElementById('preview').src = "";
	  }
	}

</script>
</head>
<body>
   <section>
   <form name="mem" method="post" action="member_edit_ok" align="center" onsubmit="return form_check()" enctype="multipart/form-data">
   <h2>회원정보 수정</h2>
   	<div><input type="text" name="userid" placeholder="아이디" value="${mvo.userid}" readonly></div>
   	<div><input type="password" name="pwd" placeholder="변경할 비밀번호를 입력하세요." value="${mvo.pwd}"></div>
   	<div><input type="text" name="name" placeholder="이름" value="${mvo.name}" readonly></div>   	
   	<div><input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"></div>
   	<div><input type="text" name="email" placeholder="이메일" value="${mvo.email}"></div>
   	<div><textarea name="sogae">${mvo.sogae}</textarea></div>
   	<img id="preview" src="../resources/img/${mvo.proimg}" width="100" height="100">
   	<div>
   		<input type="file" name="proimg" value="${mvo.proimg}" onchange="readURL(this);">
   	</div>   	
   	<div><input type="submit" value="정보 수정" id="subbtn"></div>
   </form>
   </section>
</body>
</html>
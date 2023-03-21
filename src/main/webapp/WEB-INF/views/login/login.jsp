<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
   section {
      width:1000px;
      margin:auto;
      text-align:center;
   }
   h2 {
      font-size:25px;
      font-weight:500;
   }
   section div {
      margin-top:10px;
   }
   section input[type=text] {
      width:300px;
      height:42px;
      border:1px solid #cccccc;
      padding-left:10px;
      border-radius:3px; 
   }
   section input[type=password] {
      width:300px;
      height:42px;
      border:1px solid #cccccc; 
      padding-left:10px; 
      border-radius:3px;
   }
   section input[type=submit] {
      width:300px;
      height:40px;
      border:1px solid #4776b4; 
      background:#4776b4;
      color:white;
      font-weight:bold;
      font-size:15px;
      cursor:pointer;
      border-radius:3px;
   }
   section input[type=button] {
        width: 100px;
        height:25px;
        cursor:pointer; 
        font-weight:bold; 
        background:white;
        border:none;
        color:black;
        font-size:12px;
   }
   section #uform {
      display:none;
   }
   section #pform {
      display:none;
   }
   section #sview {
      font-size:14px;
      padding-bottom:5px;
      color:#4776b4;
   }
    section #l1 {
      display:inline-block;
      width:90px;
      height:20px;
      font-size:12px;
      padding:10px;
      font-weight:500;
      cursor:pointer;
   }
    section #l2 {
      display:inline-block;
      width:90px;
      height:20px;
      font-size:12px;
      padding:10px;
      font-weight:500;
      cursor:pointer;
   }
      section #l3 {
     font-size:15px;
     font-weight:700;    
      }
      
      section #l4 {
        color:#4776b4;
        font-weight:bold;
        text-decoration:none;
      }    
      
      #popup {
   position:fixed;
   top: 0;
    right: 0;
   bottom: 0;
   left: 0;
   display:none;
}

.popup_layer {
   position: relative;
   left:785px;
   top:290px;
   width: 340px;
   height: 110px;
   padding-bottom: 40px;
   background: #fff;
   z-index: 10;
}

.text_area {
   padding: 30px 30px 30px;
   text-align: center;
   font-weight:bold;
   font-size:15px;
   color:#020202;
   background:#fff;
}

.btn_area {
   position: absolute;
   left: 0;
   right: 0;
   bottom: 0;
   height: 50px;
   overflow: hidden;
}

.btn {
   width: 100%;
   height: 100%;
   font-size: 16px;
   color:#4776b4;
   font-weight: bold;
   border: 0;
   background: #f5f5f5;
   text-decoration:none;
}
.popup_dimmed {
   position: absolute;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   background: #000;
   opacity: 0.3;
}   
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>   
   function close()
   {
      document.getElementById("popup").style.display="none";
   }
   

   //a3bfb6ab0dd5e068f7d0caadb4a4e7ac
   window.Kakao.init("a3bfb6ab0dd5e068f7d0caadb4a4e7ac");
   
   function kakaoLogin () 
   {
      window.Kakao.Auth.login({
         scope:'profile_nickname, account_email',
         success: function(authObj) {
            //consoloe.log(authObj);
            window.Kakao.API.request({
               
               
               
               url:'/v2/user/me',
               success: res => {
                  
                  const kakaoAccount = res.kakao_account;
                  console.log(kakaoAccount);
                  
                  const email = res.kakao_account.email;
                  console.log(email);
                  
                  const name = res.properties.nickname;
                  console.log(name);
                  
                  $('#kakaoemail').val(email);
                  $('#kakaoname').val(name);
                  
                  document.login_form.submit();
                  /*
                  const email = res.kakao_acount.email;
                  const name = res.properties.nickname;
               
                  console.log(email);
                  console.log(name);
                  
                  $('#kakaoemail').val(email);
                  $('#kakaoemail').val(name);
                  */
               }
               
            });
         }
      });
     }
   
   function view_uform() // 아이디 조회폼
    {
       document.getElementById("sview").innerText="";   
       document.getElementById("uform").style.display="block";
       document.getElementById("pform").style.display="none";
    }
    function view_pform() // 비밀번호 조회폼
    {
       document.getElementById("sview").innerText="";   
       document.getElementById("pform").style.display="block";
       document.getElementById("uform").style.display="none";
    }
    
    function userid_search()
    {
       
       var chk=new XMLHttpRequest();
       var name=document.uform.name.value;
       var email=document.uform.email.value;
       
       chk.onload=function()
       {
          //alert(chk.responseText.trim());
          
          var userid=chk.responseText.trim();
          if(userid=="1") // 이름, 이메일이 잘못 되었다..
           document.getElementById("sview").innerText="이름 혹은 이메일이 잘못 되었습니다";
          else
           {         
           document.getElementById("sview").innerText="회원님의 아이디는 : "+userid;
           document.getElementById("uform").style.display="none"; 
           }
       }
       
       chk.open("get","userid_search?name="+name+"&email="+email);
       chk.send();
    }
    
    function pwd_search()
    {
              
       var chk=new XMLHttpRequest();
       var userid=document.pform.userid.value;
       var name=document.pform.name.value;
       var email=document.pform.email.value;
       
       chk.onload=function()
       {
          //alert(chk.responseText.trim());
          var pwd=chk.responseText.trim();
          if(pwd=="1")
          {
            document.getElementById("sview").innerText="입력 정보가 불일치 합니다";
          }   
          else
          {
            document.getElementById("sview").innerText="회원님의 비밀번호는 : "+pwd;
            document.getElementById("pform").style.display="none";
          }      
       }
       
       chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
       chk.send();
    }
   
/*     function userid_search1(){
       
//     alert(document.getElementById("aaaa").value);
       alert(document.lwy.name.value);
    } */

</script>
</head>   
<body>
<div id="popup">
   <div class="popup_layer">
      <div class="text_area">
         <strong class="title"></strong>
         <p class="text">아이디,비밀번호를 확인해주세요.</p>
      </div>
      <div class="btn_area">
         <button type="button" name="button" class="btn"><a href="javascript:close();" style="text-decoration:none;color:#4776b4;">확인</a></button>
      </div>
   </div>
   <div class="popup_dimmed"></div>
</div>
<section>
   <form method="post" action="login_ok">
      <h2> 로그인 </h2>
      <br>
      <div> <input type="text" name="userid" placeholder="아이디를 입력해주세요" value="kim1"> </div>
        <div> <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" value="1234"> </div>
        <span id="l1" onclick="view_uform()"> 아이디 찾기 </span>|  
        <span id="l2" onclick="view_pform()"> 비밀번호 찾기 </span>
        <div> <input type="submit" value="로그인"> </div> 
       </form>
        <form name="login_form" method="post" action="login_ok2">
        <div id="kakaologin">
           <div class="kakaobtn">
              <input type="hidden" name="kakaoemail" id="kakaoemail">
              <input type="hidden" name="kakaoname" id="kakaoname">
              <a href="javascript:kakaoLogin();">
                 <img src="../resources/img/kakao_login_medium_wide.png">
              </a>
           </div>
        </div>
        </form>
        
         <!-- 아이디 , 비밀번호 출력 -->
        <div id="sview" align="center"></div>        
         <!-- 아이디 조회폼 -->         
        <form name="uform" id="uform">
         <input type="text" name="name" placeholder="이 름"> <p>
         <input type="text" name="email" placeholder="이메일"> <p>
        <input type="button" onclick="userid_search()" value="아이디 찾기">
        </form>            
         <!-- 비밀번호 조회폼 -->
        <form name="pform" id="pform">
         <input type="text" name="userid" placeholder="아이디"> <p>
         <input type="text" name="name" placeholder="이 름"> <p>
         <input type="text" name="email" placeholder="이메일"> <p>
         <input type="button" onclick="pwd_search()" value="비밀번호 찾기">
        </form>        
        <br>
        <div id=l3>아직 회원이 아니신가요? <a href="../member/member_input" id="l4">회원가입 하러가기</a></div>      
   </section>
<script>
<c:if test="${chk == 1}">
document.getElementById("popup").style.display="block";
</c:if>
</script>
</body>
</html>

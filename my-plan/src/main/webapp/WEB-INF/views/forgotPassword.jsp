<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/asset4/css/logNquesStyles.css">
    <title>忘記密碼</title>
</head>
<body>
    <img src="/asset4/image/B&B_text.png" class="logo"></img>
    <a href="#" class="index">首頁</a>
    <div class="container">
        <h2>請填入註冊時的Email</h2>
        <form action="/forgotPassword" method="post">
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required>
    <button type="submit">傳送驗證信到信箱</button>

      <c:if test="${param.error != null}">
        <div class="error">該用戶信箱不存在</div>
	</c:if>
   <c:if test="${param.success != null}">
        <div class="success">已經發送，請到信箱查看!</div>
	</c:if>
</form>
       
    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="/asset4/js/script.js">  </script>
    <script type="text/javascript">

    
    
    </script>
</body>
</html>

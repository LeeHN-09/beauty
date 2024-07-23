<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/asset4/css/logNquesStyles.css">
    <title>創建新密碼</title>
</head>
<body>
    <img src="/asset4/image/B&B_text.png" class="logo"></img>
    <a href="#" class="index">首頁</a>
    <div class="container">
        <h2>創建新密碼</h2>
   <form action="/resetPassword" method="post">
    <input type="hidden" name="token" value="${token}">
    <label for="password">新密碼:</label>
    <input type="password" name="newPassword" id="newPassword" required>
    <label for="confirmPassword">確認新密碼:</label>
    <input type="password" name="confirmPassword" id="confirmPassword" required>
    <button type="submit">送出密碼</button>

    <c:if test="${param.error != null}">
        <div class="error">There was an error processing your request.</div>
    </c:if>
	</form>   
    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="/asset4/js/script.js">  </script>
    <script type="text/javascript">   
    </script>
</body>
</html>

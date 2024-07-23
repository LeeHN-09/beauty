<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>健身目標</title>
    <!-- 引入 LineIcons 字體庫 -->
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <!-- 引入 Bootstrap 5 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset7/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" 
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 引入自定義 CSS -->   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset4/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
        
    </style>
</head>

<body>
    <div id="sidebar">
            <div class="d-flex">
                <!-- 切換按鈕 -->
                <button class="toggle-btn" type="button">
                    <i class="fas fa-bars"></i>
                </button>
                <!-- 側邊欄標誌 -->
                <div class="sidebar-logo">
                    <a href="#">B&B</a>
                </div>
            </div>
            <!-- 側邊欄導航 -->
            <ul class="sidebar-nav">

                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/dashboard" class="sidebar-link">
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_home.ico" class="icon-type">
                        <span>首頁</span>
                    </a>
                </li>

                <!-- 單個導航項目 -->
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#member" aria-expanded="false" aria-controls="member">
                        <img src="${pageContext.request.contextPath}/asset7/icon/feature04.ico" class="icon-type">
                        <span>會員中心</span>
                    </a>
                    <ul id="member" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link">個人資訊</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/goal" class="sidebar-link">健身目標</a>
                        </li>
                         <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/bodyreport" class="sidebar-link">個人健康報表</a>
                        </li>
                    </ul>
                </li>
                <!-- 嵌套導航項目 -->
                <li class="sidebar-item">
                   <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link collapsed has-dropdown" >
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_mushrooms.ico" class="icon-type">
                        <span>健身精靈</span>
                    </a>
                </li>
                <!-- 具有下拉菜單的導航項目 -->
                <li class="sidebar-item">
                    <a href="./index.jsp" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                        <img src="${pageContext.request.contextPath}/asset7/icon/feature03.ico" class="icon-type">
                        <span>我的計畫</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="/api/caloriesPage" class="sidebar-link">運動計畫</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="/eat/eatcalories" class="sidebar-link">飲食紀錄</a>
                        </li>
                    </ul>
                </li>

                <!-- 其他導航項目 -->
                <li class="sidebar-item">
                    <a href="/shop" class="sidebar-link">
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_buy.ico" class="icon-type">
                        <span>健身好物</span>
                    </a>
                </li>

            </ul>
            <!-- 側邊欄底部 -->
            <div class="sidebar-footer">
                <a href="#" class="sidebar-link">
                    <img src="${pageContext.request.contextPath}/asset7/icon/nav_logout.ico" class="icon-type">
                    <span>登出</span>
                </a>
            </div>
        </div>
    <div class="main-content">
        <div class="content goal-content">
            <div>
                <img src="${pageContext.request.contextPath}/asset4/image/831b1157b1e47e7f03b52c5c8a3cd2d5_t.jpeg" class="goal-img">
            </div>
            <div style="margin-top: 50px;">
                <form action="">
                    <!-- 1.目標 -->
                    <div class="form-group">
                        <label class="contact-label" for="goal">健身目標</label>
                        <select name="goal" id="goal">
                           
                            <option value="muscle">增加肌肉</option>
                            <option value="weight_loss">瘦身減重</option>
                            <option value="health">保持健康</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <!-- 2.習慣 -->
                    <div class="form-group">
                        <label class="contact-label" for="habit">每周訓練量</label>
                        <select name="habit" id="habit">
                            <option selected="true" disabled>==下列請選擇==</option>
                            <option value="1">久坐</option>
                            <option value="2">輕度活動</option>
                            <option value="3">中度活動</option>
                            <option value="4">高度活動</option>
                            <option value="5">超高度活動</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <!-- 3.體重 -->
                    <div class="form-group">
                        <label class="contact-label" for="targetweight">目標體重</label>
                        <input type="text" name="targetweight" id="targetweight" placeholder="請輸入體重" required>
                    </div>
                    <br>
                    <br>
                    <!-- 4.達成時間 -->
                    
                    <br>
                    <br>
                    <p class="text-right">
                    <input class="submit-btn" type="submit" value="儲存" onclick="updateUser2()">
                </p>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset4/js/indexjs.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const loginEmail = sessionStorage.getItem("logInEmail");
        console.log("Login email from session storage:", loginEmail);

        if (loginEmail) {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "http://localhost:8080/user/" + encodeURIComponent(loginEmail), true);
            console.log("XHR created:", xhr);

            xhr.onreadystatechange = function() {
                console.log("Ready state change:", xhr.readyState);

                if (xhr.readyState === 4) {
                    console.log("XHR response text:", xhr.responseText);
                    if (xhr.status === 200) {
                        const user = JSON.parse(xhr.responseText);
                        console.log("User data fetched:", user);

                        var fieldMapping = {
                            
                            targetweight: 'target_weight',
                            goal: 'purpose',
                            habit: 'activity_level'
                        };

                        for (var field in fieldMapping) {
                            if (fieldMapping.hasOwnProperty(field)) {
                                const element = document.getElementById(field);
                                const value = user[fieldMapping[field]];
                               
                                if (element) {
                                    if (field === 'preview' && value) {
                                        element.src = value;
                                    }if (field === 'birth' && value) {
                                        const date = new Date(value);
                                        const year = date.getFullYear();
                                        const month = String(date.getMonth() + 1).padStart(2, '0');
                                        const day = String(date.getDate()).padStart(2, '0');
                                        console.log(year +'-'+ month+'-'+day);
                                        element.value = year +'-'+ month+'-'+day;
                                    }else {
                                        element.value = value !== null && value !== undefined ? value : "";
                                    }
                                }
                            }
                        }
                    } else {
                        console.log("Failed to fetch user data. Status code:", xhr.status);
                        alert("無法獲取用戶資料，狀態碼: " + xhr.status);
                    }
                }
            };

            xhr.onerror = function() {
                console.log("XHR request failed");
                alert("請求失敗，請檢查伺服器連接。");
            };

            xhr.send();
            console.log("XHR request sent");
        } else {
            console.log("No login email found in session storage.");
            alert("請先登入");
        }
    });
    function updateUser2() {
    	 const user = {
    	     purpose:document.getElementById('goal').value,
    	     target_weight: document.getElementById('targetweight').value,
    	     activity_level: document.getElementById('habit').value
    	 };

    	 if (file) {
    	     const reader = new FileReader();
    	     reader.onload = function(e) {
    	         user.face = e.target.result;
    	         sendUserData(user);
    	     }
    	     reader.readAsDataURL(file);
    	 } else {
    	     sendUserData(user);
    	 }
    	}

    	function sendUserData(user) {
    	 fetch('/updateUser', {
    	     method: 'POST',
    	     headers: {
    	         'Content-Type': 'application/json'
    	     },
    	     body: JSON.stringify(user)
    	 })
    	 .then(response => {
    		 console.log('Response:', response);
    		 if (!response.ok) {
    	     throw new Error('Network response was not ok ' + response.statusText);
    	 }
    	 
    	 return response.json();})
    	 .then(data => {
    		 console.log('Response data:', data);
    		 alert(data.message);})
    	     .catch(error => {console.error('Error:', error);alert('更新失敗');
    	    });
    	}
    </script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>會員首頁</title>
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
</head>

<body onload="previewImage()">
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
                            <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link childsl">個人資訊</a>
                        </li>
                        
                         <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/bodyreport" class="sidebar-link childsl">個人健康報表</a>
                        </li>
                    </ul>
                </li>
                <!-- 嵌套導航項目 -->
                <li class="sidebar-item">
                   <a href="/elves" class="sidebar-link collapsed has-dropdown" >
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
                            <a href="/api/caloriesPage" class="sidebar-link childsl">運動計畫</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="/eat/eatcalories" class="sidebar-link childsl">飲食紀錄</a>
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
        <div class="content">
            <div class="face">
                <img id="preview" src="${pageContext.request.contextPath}/asset4/image/images (2).jpg" style="width: 100px; height: 100px;">
              
                <input class="chooseface" type="file"  id="chooseface" value=""><br>
                <label class="contact-label" for="nickname">HI  <input type="text" name="nickname" id="nickname" placeholder="暱稱" value="">
                </label>
                <p class="text-right">
                    <input class="submit-btn" type="submit" value="儲存" onclick="updateUser()">
                </p>
                
            </div>
            <form id="userForm">
                <div class="form-grid">
            <!-- 登出按钮刪除0608 -->
                    <!-- 第1项 -->
                    <div class="form-group">
                        <label class="contact-label" for="email">*信箱</label>
                        <input type="email" name="email" id="email" placeholder="請輸入信箱" value="" required>
                    </div>
                    <!-- 第2项 -->
                     <div class="form-group">
                        <label class="contact-label" for="password">密碼</label>
                        <div class="btn-block">
                            <button id="myBtn" class="btn btn-shadow">更改密碼</button>
                        </div>
                    </div>
                    <!-- 第3项 -->
                    <div class="form-group">
                        <label class="contact-label" for="sex">性別</label>
                        <select name="sex" id="sex">
                            <option selected="true" disabled>==下列請選擇==</option>
                            <option value="male">男</option>
                            <option value="female">女</option>
                        </select>
                    </div>
                    <!-- 第4项 -->
                    <div class="form-group">
                        <label class="contact-label" for="birth">生日</label>
                        <input type="date" name="birth" id="birth" value="">
                    </div>
                    <!-- 第5项 -->
                    <div class="form-group">
                        <label class="contact-label" for="tel">手機號碼</label>
                        <input type="text" name="tel" id="tel" placeholder="09XXXXXXXX" value="" required>
                    </div>
                    <!-- 第6项 -->
                    <div class="form-group">
                        <label class="contact-label" for="height">身高</label>
                        <input type="text" name="height" id="height" placeholder="請輸入身高" value="" required>
                    </div>
                    <!-- 第7项 -->
                    <div class="form-group">
                        <label class="contact-label" for="weight">體重</label>
                        <input type="text" name="weight" id="weight" placeholder="請輸入體重" value="" required>
                    </div>
                    <div class="form-group">
                        <label class="contact-label" for="goal">健身目標</label>
                        <select name="goal" id="goal">
                           
                            <option value="muscle">增加肌肉</option>
                            <option value="weight_loss">瘦身減重</option>
                            <option value="health">保持健康</option>
                        </select>
                    </div>
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
                    <!-- 3.體重 -->
                    <div class="form-group">
                        <label class="contact-label" for="targetweight">目標體重</label>
                        <input type="text" name="targetweight" id="targetweight" placeholder="請輸入體重" required>
                    </div>
                <!-- 送出表單按钮 -->
                
                </div>
            </form>            
        </div>
    </div>

    
    
     <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <input id="oldPassword" type="password" placeholder="舊密碼"><br>
            <input id="newPassword" type="password" placeholder="新密碼"><br>
            <input id="confirmPassword" type="password" placeholder="確認密碼"><br>
            <p class="text-right">
                <input class="submitpasswd-btn" type="button" value="儲存" onclick="changePassword()">
            </p>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bcryptjs@2.4.3/dist/bcrypt.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset4/js/indexjs.js"></script>
   <script>
   //抓資料
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
                        preview: 'face',
                        nickname: "nickname",
                        email: 'email',
                        sex: 'gender',
                        birth: 'birthday',
                        tel: 'phone',
                        height: 'height_cm',
                        weight: 'current_weight',
                        goal: 'purpose',
                        habit: 'activity_level',
                        targetweight: 'target_weight'
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



        
     //判斷0613
      
 previewImage();
     
 

function previewImage() {
 const fileInput = document.getElementById('chooseface');
 const img = document.getElementById('preview');
 
 fileInput.addEventListener('change', function() {
     const file = fileInput.files[0];
     if (file) {
         const reader = new FileReader();
         reader.onload = function(e) {
             img.src = e.target.result;
         }
         reader.readAsDataURL(file);
     }
 });
}

function updateUser() {
 const fileInput = document.getElementById('chooseface');
 const file = fileInput.files[0];
 const user = {
     email: document.getElementById('email').value,
     nickname: document.getElementById('nickname').value,
     gender: document.getElementById('sex').value,
     birthday: document.getElementById('birth').value,
     phone: document.getElementById('tel').value,
     height_cm: document.getElementById('height').value,
     current_weight: document.getElementById('weight').value,
     face: document.getElementById('preview').src,
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

 function changePassword() {
     const passwordChangeRequest = {
         email: document.getElementById('email').value,
         oldPassword: document.getElementById('oldPassword').value,
         newPassword: document.getElementById('newPassword').value
     };

     fetch('/changePassword', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json'
         },
         body: JSON.stringify(passwordChangeRequest)
     })
     .then(response => response.json())
     .then(data => alert(data.message))
     .catch(error => console.error('Error:', error));
 }
 </script>
</body>

</html>

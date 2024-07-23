<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <title>健身報表</title>
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
    input{
    border: none;
    pointer-events: none;
    }
   select{
    border: none;
    pointer-events: none;
     -webkit-appearance: none; 
    }
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
                    <a href="/dashboard" class="sidebar-link">
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_home.ico" class="icon-type">
                        <span>首頁</span>
                    </a>
                </li>

                <!-- 單個導航項目 -->
                <li class="sidebar-item">
                    <a href="/index" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#member" aria-expanded="false" aria-controls="member">
                        <img src="/asset7/icon/feature04.ico" class="icon-type">
                        <span>會員中心</span>
                    </a>
                    <ul id="member" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="/index" class="sidebar-link">個人資訊</a>
                        </li>
                        
                         <li class="sidebar-item">
                            <a href="/bodyreport" class="sidebar-link">個人健康報表</a>
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
        <div class="rp-container">
        	<div class="form-grid">       	
            <div class="section">
                <h2>個人基本資料</h2>
                <p>性別: <input id="sex" value=""></p>
                <p>身高: <input id="height" value="">  cm</p>
                <p>體重: <input id="weight" value="">  kg</p>
                <p>年齡: <input id="age" value=""> 歲</p>
                <p>運動等級: <select name="habit" id="habit">
                            <option selected="true" disabled>==下列請選擇==</option>
                            <option value="1">久坐</option>
                            <option value="2">輕度活動</option>
                            <option value="3">中度活動</option>
                            <option value="4">高度活動</option>
                            <option value="5">超高度活動</option>
                        </select></p>
            </div>
            <div class="section">
                <h2>數據</h2>
                <p>BMI值: <input id="bmi" value=""></p>
                <p>BMR值: <input id="bmr" value=""> kcal/day</p>
                <p>TDEE值: <input id="tdee" value=""> kcal/day</p>
            </div>
            </div>
            <div class="section">
                <h2>體重變化折線圖</h2>
                <div class="chart-container">
                    <canvas id="weightChart"></canvas>
                </div>
            </div>
            <div class="section">
                <h2>備註</h2>
                <textarea placeholder="在此輸入備註..."></textarea>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="<%= request.getContextPath() %>/asset4/js/script.js"></script>
     <script>
     document.addEventListener("DOMContentLoaded", function() {
    	    const loginEmail = sessionStorage.getItem("logInEmail");
    	    console.log("Login email from session storage:", loginEmail);

    	    if (loginEmail) {
    	    	//建立兩個伺服器資料
    	        const xhr = new XMLHttpRequest();
    	        const xhr1 = new XMLHttpRequest();

    	        xhr.open("GET", "http://localhost:8080/user/" + loginEmail, true);
    	        xhr1.open("GET", "http://localhost:8080/user/weight-chart/" + loginEmail, true);

    	        xhr1.onreadystatechange = function() {
    	            
    	            if (xhr1.readyState === 4) {
    	                if (xhr1.status === 200) {
    	                	const response = JSON.parse(xhr1.responseText);
                            console.log("User1 data fetched:", response);

                            const user = response.user;
                            const weights = response.weights;
    	                    // 拿當前時間的前六個月
    	                    const currentDate = new Date();
    	                    const monthLabels = [];
    	                    for (let i = 5; i >= 0; i--) {
    	                        const date = new Date(currentDate.getFullYear(), currentDate.getMonth() - i, 1);
    	                        monthLabels.push(date.toLocaleString('default', { month: 'long' }));
    	                    }

    	                    // 從 fitnessGoals 中提取 weights 
    	                    // 設 user.fitnessGoals 是包含體重的數據
    	                    const fitnessGoals = user.fitnessGoals; 
    	                    // 初始化 currentWeights 数據為 NaN
    	                    const currentWeights = new Array(6).fill(NaN); 
    	                    //存月平均體重
    	                    const monthData = {};
    	                    //設目標體重為  target_weight
    	                    const targetWeight = user.target_weight; 

    	                    fitnessGoals.forEach(fitnessGoal => {
    	                        const updateAt = new Date(fitnessGoal.update_at);
    	                        const monthDiff = currentDate.getMonth() - updateAt.getMonth() + 
    	                                          (12 * (currentDate.getFullYear() - updateAt.getFullYear()));
    	                        if (monthDiff >= 0 && monthDiff < 6) {
                                    const monthIndex = 5 - monthDiff;
                                    if (!monthData[monthIndex]) {
                                        monthData[monthIndex] = [];
                                    }
                                    monthData[monthIndex].push(fitnessGoal.current_weight);
                                }
    	                    });
    	                 	// 計算每個月的平均體重
                            for (let i = 0; i < 6; i++) {
                                if (monthData[i] && monthData[i].length > 0) {
                                    const totalWeight = monthData[i].reduce((sum, weight) => sum + weight, 0);
                                    const avgWeight = totalWeight / monthData[i].length;
                                    currentWeights[i] = avgWeight;
                                } else {
                                    currentWeights[i] = 0; // 如果該月沒有數據，預設為0
                                }
                            }
    	                    const goalWeights = new Array(6).fill(targetWeight); 

    	                    // 圖表start
    	                    var ctx = document.getElementById('weightChart').getContext('2d');
    	                    var weightChart = new Chart(ctx, {
    	                        type: 'line',
    	                        data: {
    	                            labels: monthLabels,
    	                            datasets: [{
    	                                label: '現在體重 (kg)',
    	                                data: currentWeights,
    	                                borderColor: 'rgb(75, 192, 192)',
    	                                fill: false
    	                            }, {
    	                                label: '目標體重 (kg)',
    	                                data: goalWeights,
    	                                borderColor: 'rgb(255, 99, 132)',
    	                                fill: false
    	                            }]
    	                        },
    	                        options: {
    	                            responsive: true,
    	                            scales: {
    	                                x: {
    	                                    display: true,
    	                                    title: {
    	                                        display: true,
    	                                        text: '月份'
    	                                    }
    	                                },
    	                                y: {
    	                                    display: true,
    	                                    title: {
    	                                        display: true,
    	                                        text: '體重 (kg)'
    	                                    }
    	                                }
    	                            }
    	                        }
    	                    });
    	                }
    	            }
    	        };
    	     // 圖表end
    	     // 資料導入 運算BMI BMR TDEE  start
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
    	                        weight:'current_weight',
    	                        goal: 'purpose',
    	                        habit:'activity_level',
    	                        age:'age'
    	                    };

    	                    for (var field in fieldMapping) {
    	                        if (fieldMapping.hasOwnProperty(field)) {
    	                            const element = document.getElementById(field);
    	                            const value = user[fieldMapping[field]];
    	                            if (element) {
    	                                if (field === 'sex') {
    	                                   if(value === 'male'){
    	                                	   element.value='男性'
    	                                   }else{
    	                                	   element.value='女性'
    	                                   }
    	                                } else {
    	                                    element.value = value !== null && value !== undefined ? value : "";
    	                                }
    	                            }
    	                        }
    	                    }

    	                   
    	                    
    	                    // BMI計算
    	                    if (height.value && weight.value) {
    	                        const heightInMeters = height.value / 100;
    	                        const bmi = weight.value / Math.pow(heightInMeters, 2);
    	                       
    	                       document.getElementById("bmi").value = bmi.toFixed(2); // 保留兩位小數
    	                    } else {
    	                        console.log("Height, weight, or BMI element not found.");
    	                    }
    	                    // BMR計算
    	                    if(sex.value == "男性"){
    	                        const bmr = 13.7 * weight.value + 5 * height.value - 6.8 * age.value + 66;
    	                        document.getElementById("bmr").value = bmr.toFixed(2);
    	                    } else if(sex.value == "女性"){
    	                        const bmr = 9.6 * weight.value + 1.8 * height.value - 4.7 * age.value + 655;
    	                        document.getElementById("bmr").value = bmr.toFixed(2);
    	                    }
    	                    // TDEE計算
    	                    switch (habit.value) {
    	                        case "1":
    	                            const tdee1 = 1.2 * document.getElementById("bmr").value;
    	                            document.getElementById("tdee").value = tdee1.toFixed(0);
    	                            break;
    	                        case "2":
    	                            const tdee2 = 1.375 * document.getElementById("bmr").value;
    	                            document.getElementById("tdee").value = tdee2.toFixed(0);
    	                            break;
    	                        case "3":
    	                            const tdee3 = 1.55 * document.getElementById("bmr").value;
    	                            document.getElementById("tdee").value = tdee3.toFixed(0);
    	                            break;
    	                        case "4":
    	                            const tdee4 = 1.725 * document.getElementById("bmr").value;
    	                            document.getElementById("tdee").value = tdee4.toFixed(0);
    	                            break;
    	                        case "5":
    	                            const tdee5 = 1.9 * document.getElementById("bmr").value;
    	                            document.getElementById("tdee").value = tdee5.toFixed(0);
    	                            break;
    	                    }
    	                } else {
    	                    console.log("Failed to fetch user data. Status code:", xhr.status);
    	                    console.log("無法獲取用戶資料");
    	                }
    	            }
    	        };

    	        xhr.send();
    	        xhr1.send(); 
    	    } else {
    	        console.log("No login email found in session storage.");
    	    }
    	});
     // 資料導入 運算BMI BMR TDEE  end
        </script>
</body>

</html>

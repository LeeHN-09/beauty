<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.DailyCalories" %>
<%
    ObjectMapper objectMapper = new ObjectMapper();
    String dailyCaloriesJson = (String) request.getAttribute("dailyCaloriesJson");
    Integer totalCalories = (Integer) request.getAttribute("totalCalories");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beauty & Beast</title>
    <!-- 引入 LineIcons 字體庫 -->
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <!-- 引入 Bootstrap 5 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset7/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 引入自定義 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset7/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        /* 您的自定義 CSS 可以放在這裡 */
         .form-grid {
		    display: grid;
		    grid-template-columns: 1fr 1fr;
		    /* 两列布局 */
		    gap: 10px 20px;
		    /* 10px纵向间距，20px横向间距 */
		}
		
		.chart-container {
            position: relative;
            width: 100%; /* 设置容器的宽度 */
            height: 0;
            padding-bottom:30%; /* 维持宽高比 */
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- 側邊欄開始 -->
        <aside id="sidebar">
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
                    <a href="" class="sidebar-link">
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_home.ico" class="icon-type">
                        <span>首頁</span>
                    </a>
                </li>

                <!-- 單個導航項目 -->
                <li class="sidebar-item">
                    <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#member" aria-expanded="false" aria-controls="member">
                        <img src="/asset7/icon/feature04.ico" class="icon-type">
                        <span>會員中心</span>
                    </a>
                    <ul id="member" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/index" class="sidebar-link">個人資訊</a>
                        </li>
                        
                         <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/views/bodyreport" class="sidebar-link">個人健康報表</a>
                        </li>
                    </ul>
                </li>
                <!-- 嵌套導航項目 -->
                <li class="sidebar-item">
                    <a href="/elves" class="sidebar-link">
                        <img src="${pageContext.request.contextPath}/asset7/icon/nav_mushrooms.ico" class="icon-type">
                        <span>健身精靈</span>
                    </a>
                </li>
                <!-- 具有下拉菜單的導航項目 -->
                <li class="sidebar-item">
                    <a href="/" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
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
                <a href="/logout" class="sidebar-link">
                    <img src="${pageContext.request.contextPath}/asset7/icon/nav_logout.ico" class="icon-type">
                    <span>登出</span>
                </a>
            </div>
        </aside>
        <!-- 主內容區域 -->
        <div class="main p-3">
            <div class="main-content">
                <div class="header">
                    <h1>卡路里紀錄表</h1>
                </div>
                <div class="plan-section chart-container">
                    <canvas id="myChart"></canvas>
                </div>
                
                <div class="form-grid">
                <div>
                <img  id="character-image-1" class="elf" alt="" src="${pageContext.request.contextPath}/asset7/img/13.png">
                </div>
                <div class="mwt_border">
					<span class="arrow_l_int"></span>
				    <span class="arrow_l_out"></span>
					<h2>總共攝取<%= totalCalories != null ? totalCalories : 0 %>大卡</h2>
				</div>
                </div>
            </div>
            <div class="custom-box">
                <div class="header1">
                    <h2>每日簽到</h2>
                </div>
                <div class="calendar">
                    <div class="calendar-header">
                        <!-- 年 -->
                        <div class="year-picker">
                            <span class="year-change" id="prev-year"><pre><</pre></span>
                            <div id="year">2024</div>
                            <span class="year-change" id="next-year"><pre>></pre></span>
                        </div>
                        <!-- 月 -->
                        <span class="month-picker" id="month-picker">May</span>
                    </div>
                    <div class="calendar-body" style="width: 100%;">
                        <!-- 星期 -->
                        <div class="calendar-week-day">
                            <div>日</div>
                            <div>一</div>
                            <div>二</div>
                            <div>三</div>
                            <div>四</div>
                            <div>五</div>
                            <div>六</div>
                        </div>
                        <!-- 日期 -->
                        <div class="calendar-days"></div>
                    </div>
                    <div class="month-list"></div>
                </div>
                <div class="btn1-container">
                    <button class="btn1" id="btncheck" data-hover="&#128073;click me!"><div style="color: white;">簽到</div></button>
                </div>
                <!-- <div style="text-align: center;">
                    <label class="contact-label" for="currentWeight">目前體重: </label>
                    <input type="text" name="currentWeight" id="currentWeight" placeholder="量一下吧!" required>
                    <button type="submit" onclick="updateUser()">儲存</button>
                </div>
                 -->
                
            </div>
        </div>
    </div>
    <!-- 引入 Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!-- 引入自定義 JavaScript -->
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/asset7/js/script.js"></script>
    <script>
    window.addEventListener('load', function() {
        const params = new URLSearchParams(window.location.search);
        if (params.has('loginId') && params.has('email')) {
            const loginId = params.get('loginId');
            const email = params.get('email');
            sessionStorage.setItem('logInEmail', email);
            sessionStorage.setItem('loginId', loginId);
            if (!sessionStorage.getItem('reloaded')) {
                // 如果沒有，設置標誌並重新整理頁面
                sessionStorage.setItem('reloaded', 'true');
                window.location.reload();
            }
        }
    });
    
   
        // 从 sessionStorage 中获取 response
        document.addEventListener("DOMContentLoaded", function() {
            console.log(sessionStorage);
            const responseString = sessionStorage.getItem("loginId");
            if (responseString) {
                const responseObject = JSON.parse(responseString);
                console.log('Parsed response object:', responseObject);
                console.log('Extracted userId:', responseObject);
                if (responseObject) {
                    // 检查用户今天是否已经签到
                    fetch(`/checkCheckinStatus?userId=` + responseObject, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                        }
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok ' + response.statusText);
                        }
                        return response.json();
                    })
                    .then(data => {
                        if (data.hasCheckedInToday) {
                            console.log('User has already checked in today.');
                            getCheckinLogsByUserId(responseObject);
                        } else {
                            console.log('User has not checked in today.');
                            fetch('/add', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded',
                                },
                                body: new URLSearchParams({
                                    'userId': responseObject,
                                })
                            })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                console.log('Success:', data);
                                // 这里调用 getCheckinLogsByUserId 函数
                                getCheckinLogsByUserId(responseObject);
                            })
                            .catch((error) => {
                                console.error('Error:', error);
                            });
                        }
                    })
                    .catch((error) => {
                        console.error('Error:', error);
                    });
                } else {
                    console.error('UserId is undefined or null');
                }
            } else {
                console.error('No response found in sessionStorage');
            }
        });

        function getCheckinLogsByUserId(responseObject) {
            console.log('Fetching checkin logs for userId:', responseObject);
            fetch(`/check/` + responseObject, {
                method: 'GET', // 使用 GET 方法
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                console.log('Checkin logs:', data);
                data.forEach(log => {
                    const checkinDate = new Date(log.checkin_date);
                    const year = checkinDate.getFullYear();
                    const month = checkinDate.getMonth();
                    const date = checkinDate.getDate();
                    console.log('Fetching checkin logs for userId:', responseObject);
                    // 如果是当前月份和年份，标记签到日期
                    if (year === new Date().getFullYear() && month === new Date().getMonth()) {
                        const firstDayOfMonth = new Date(year, month, 1).getDay();
                        const calculatedIndex = Math.max(date + firstDayOfMonth, 1);
                        const dayElement = document.querySelector(`.calendar-days div:nth-child(` + calculatedIndex + `)`);
                        if (dayElement) {
                            dayElement.style.backgroundColor = "green"; // 标记已签到日期
                        }
                    }
                });
              //若沒有簽到顯示紅色 0624尚未合併
    	        const today = new Date();
    	        const currentYear = today.getFullYear();
    	        const currentMonth = today.getMonth();
    	        const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

    	        for (let day = 1; day <= today.getDate(); day++) {
    	            const firstDayOfMonth = new Date(currentYear, currentMonth, 1).getDay();
    	            const calculatedIndex = Math.max(day + firstDayOfMonth, 1);
    	            const dayElement = document.querySelector(`.calendar-days div:nth-child(` + calculatedIndex + `)`);
    	            if (dayElement && dayElement.style.backgroundColor !== "green") {
    	                dayElement.style.backgroundColor = "red"; // 标记未签到日期为红色
    	            }
    	        }
    	    })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
        }

        function updateUser() {
            const responseString = sessionStorage.getItem("loginId");
            const responseObject = JSON.parse(responseString);
            const userId = responseObject.user_id;
            const fitnessGoal = {
                user_id: userId,
                current_weight: document.getElementById("currentWeight").value
            };
            sendUserData(fitnessGoal);
        }

        function sendUserData(fitnessGoal) {
            fetch('/updateWeight', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(fitnessGoal)
            })
            .then(response => {
                console.log('Response:', response);
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
        
        const chartElement = document.getElementById('myChart');
        chartElement.setAttribute("width","800");
        chartElement.setAttribute("height","250");
         const dailyCalories = JSON.parse('<%= dailyCaloriesJson %>');
    		console.log(dailyCalories);
    		 const labels = dailyCalories.map(dc => {
    	            const date = new Date(dc.date);
    	            return date.getMonth() + 1+'/'+date.getDate();
    	        });
         const data = dailyCalories.map(dc => dc.totalCalories);
         console.log(labels);
         console.log(data);
         const chartData = {
             labels: labels,
             datasets: [{
                 label: '卡路里',
                 data: data,
             }]
         };

         new Chart(chartElement, {
         	type: 'line',
             data: chartData,
             options: {
             	 responsive: true, // 使图表响应式
                 scales: {
                     x: {
                         title: {
                             display: true,
                             text: '日期'
                         }
                     },
                     y: {
                         title: {
                             display: true,
                             text: '卡路里'
                         }
                     }
                 }
             }
         });
         
         //=====================================
        	 $(document).ready(function () {
    console.log("Document ready!");

    // 从 sessionStorage 获取登录信息
    const userId = sessionStorage.getItem("loginId");
    console.log(userId); // 打印 userId，用于调试

    // 如果 userId 为空，提示重新登录
    if (!userId) {
        alert("未找到用户ID，请重新登录。");
        return;
    }

    // 构建后端 API 请求地址
    const apiUrl = `/api/elves/`+userId;
    console.log(apiUrl)
    // 发送 GET 请求获取精灵数据
    $.ajax({
        url: apiUrl,
        type: "GET",
        success: function (response) {
            console.log("Response from server:", response);

            // 根据响应设置精灵图片
            if (response) {
                $("#character-image-1").attr("src", "data:image/png;base64," + response);
            }

            // 设置精灵名字
            if (response.name) {
                $("#character-name-1").text(response.name);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error fetching data:", error); // 输出详细的错误信息到控制台
            alert("获取用户的精灵数据失败，请稍后再试。");
        }
    });
});
        
    </script>
</body>
</html>

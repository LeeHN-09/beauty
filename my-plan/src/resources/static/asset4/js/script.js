//===============加入資料庫 start======
function submitPart1() {
        const responsePart = {
        	gender: document.querySelector('input[name="gender"]:checked').value,
            birthday: document.getElementById('birth').value,
            height_cm: document.getElementById('height').value
        };
        
        axios.post('http://localhost:8080/part1', responsePart)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
                sessionStorage.setItem('response1', JSON.stringify(res.data));
            	
            })
            .catch(function (error) {
                console.error('There was an error!', error);
                
            });
    }
 function submitPart2() {
    	const storedResponse = JSON.parse(sessionStorage.getItem('response'));
    	const storedResponse1 = JSON.parse(sessionStorage.getItem('response1'));
        const responsePart = {
        	purpose: document.getElementById('main-goal').value,
        	current_weight: document.getElementById('nowWeight').value,
        	target_weight: document.getElementById('goalWeight').value
        };
        
        axios.post('http://localhost:8080/part2', responsePart)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
             	sessionStorage.setItem('response1', JSON.stringify(res.data));
             	
            })
            .catch(function (error) {
                console.error('There was an error!', error);
            });
    }
 function submitPart3() {
    	const storedResponse = JSON.parse(sessionStorage.getItem('response'));
        const storedResponse1 = JSON.parse(sessionStorage.getItem('response1'));
        const responsePart = {
        	update_at: document.querySelector('input[name="ques3"]:checked').value
        	
        };
        
        axios.post('http://localhost:8080/part3', responsePart)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
            	sessionStorage.setItem('response1', JSON.stringify(res.data));
            	
            })
            .catch(function (error) {
                console.error('There was an error!', error);
            });
    }
  function submitPart4() {
    	const storedResponse = JSON.parse(sessionStorage.getItem('response'));
        const storedResponse1 = JSON.parse(sessionStorage.getItem('response1'));
        const responsePart = {
        	activity_level : document.querySelector('input[name="ques4"]:checked').value
        	
        };
        
        axios.post('http://localhost:8080/part4', responsePart)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
            	 sessionStorage.setItem('response1', JSON.stringify(res.data));
            	
            })
            .catch(function (error) {
                console.error('There was an error!', error);
            });
    }
    function submitPart5() {
    	const storedResponse = JSON.parse(sessionStorage.getItem('response'));
        const storedResponse1 = JSON.parse(sessionStorage.getItem('response1'));
        const responsePart = {
        	real_name: document.getElementById('username').value,
            email: document.getElementById('email').value,
            password: document.getElementById('password').value
        	
        };
        
        axios.post('http://localhost:8080/part5', responsePart)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
            sessionStorage.setItem('response1', JSON.stringify(res.data));
            alert('Account created successfully');
              window.location.href = '/views/login';//成功時才跳轉
            })
            .catch(function (error) {
                if (error.response && error.response.status === 409) {
                alert(error.response.data); // 提示email已存在
                document.getElementById('email').value = ''; // 清空email输入框
                document.getElementById('email').focus(); //沒成功
            } else {
                console.error('There was an error!', error);
                alert('Account creation failed: ' + error.response.data);
            }
            });
    }
    
    

//===============加入資料庫 end======
// ============測驗 btn檢查欄位後到下一題  start=======
function validateForm1(event) {
    event.preventDefault(); // 防止表單提交
    const gender = document.querySelector('input[name="gender"]:checked');
    const birth = document.getElementById('birth').value;
    const height = document.getElementById('height').value;

    if (gender && birth && height) {
        // 所有字段都已填寫，進行下一步
        submitPart1();
        window.location.href = '/views/question2r';
    } else {
        // 有字段未填寫，顯示警告信息
        alert('請填寫所有欄位');
    }
}

function validateForm2(event) {
    event.preventDefault(); // 防止表單提交
    const mainGoal = document.getElementById('main-goal').value;
    const nowWeight = document.getElementById('nowWeight').value;
    const goalWeight = document.getElementById('goalWeight').value;

    if (mainGoal !== "==請選擇==" && nowWeight && goalWeight) {
        // 所有字段都已填寫，進行下一步
        submitPart2();
        window.location.href = '/views/question3r';
        
    } else {
        // 有字段未填寫，顯示警告信息
        alert('請填寫所有欄位');
    }
}

function validateForm3(event) {
    event.preventDefault(); // 防止表單提交
    const waterAns = document.querySelector('input[name="ques3"]:checked');

    if (waterAns) {
        // 所有字段都已填寫，進行下一步
        submitPart3();
        window.location.href = '/views/question4r';
        
    } else {
        // 有字段未填寫，顯示警告信息
        alert('請填寫所有欄位');
    }
}

function validateForm4(event) {
    event.preventDefault(); // 防止表單提交
    const exerciseAns = document.querySelector('input[name="ques4"]:checked');

    if (exerciseAns) {
        // 所有字段都已填寫，進行下一步
        submitPart4();
        window.location.href = '/views/signIn-r';
        
    } else {
        // 有字段未填寫，顯示警告信息
        alert('請填寫所有欄位');
    }
}

function validateForm5(event) {
    event.preventDefault(); // 防止表單提交
    const name = document.getElementById('username').value;
	const email = document.getElementById('email').value;
	const password = document.getElementById('password').value;
	const confirmpassword = document.getElementById('confirm-password').value;
    if (name && email && (password==confirmpassword)) {
         

       const requestData = {
            real_name: name,
            email: email,
            password: password
        };
         axios.post('http://localhost:8080/part5', requestData)
            .then(function (res) {
                sessionStorage.setItem('response', JSON.stringify(res.data));
                sessionStorage.setItem('response1', JSON.stringify(res.data));
                window.location.href = '/views/loginr';
            })
            .catch(function (error) {
                console.error('There was an error!', error);
                alert(error.response.data); // 显示错误信息
            });
    } else if(name && email && (password!=confirmpassword)){
        // 密碼不對
        alert('請確認密碼');
    }else{
		alert('請填寫所有欄位');
	}
}
// ============測驗 btn檢查欄位後到下一題  end=======

// ============navbar開合 start=======
document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.menu-icon').addEventListener('click', function() {
        const navbar = document.querySelector('.navbar');
        const mainContent = document.querySelector('.main-content');
        
        if (navbar.classList.contains('expanded')) {
            navbar.classList.remove('expanded');
            mainContent.classList.remove('shifted');
        } else {
            navbar.classList.add('expanded');
            mainContent.classList.add('shifted');
        }
    });
});

// ============navbar開合 end=======
//========================0623
const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
document.querySelector("#sidebar").classList.toggle("expand");
});
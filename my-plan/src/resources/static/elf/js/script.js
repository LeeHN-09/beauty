// 漢堡選單按鈕切換側邊欄擴展狀態
const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
  document.querySelector("#sidebar").classList.toggle("expand");
});

// 打開側邊導航欄
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

// 關閉側邊導航欄
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

// 選單
var modal = document.getElementById("myModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
function openForm(mealType) {
  modal.style.display = "block";
  document.getElementById("mealType").innerText = mealType + "填寫表單";
}

// When the user clicks on <span> (x), close the modal
function closeForm() {
  modal.style.display = "none";
}

//

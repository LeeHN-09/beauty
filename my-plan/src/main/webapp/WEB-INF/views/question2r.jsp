<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Quest2</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <link rel="stylesheet" href="/asset4/css/style.css" />

    <!-- Google Font -->
    <!-- English -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
      rel="stylesheet"
    />

    <!-- Chinese -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap"
      rel="stylesheet"
    />

    <style>
      .noto-sans-tc {
        font-family: "Noto Sans TC", sans-serif;
        font-optical-sizing: auto;
        font-weight: 400;
        font-style: normal;
      }
      *,
      h1,
      h2,
      h3,
      h4,
      h5,
      .h1,
      .h2,
      .h3,
      .h4,
      .h5 {
        font-family: "Noto Sans TC", sans-serif;
      }

      .body {
        /* background-image: url('../image/pexels-pixabay.jpg'); */
        background: linear-gradient(
          to right top,
          rgb(246, 222, 136) 20%,
          rgb(242, 128, 128) 80%
        );
      }
    </style>
  </head>
  <body>
    <!-- question section 1 -->

    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6 text-center mb-5">
            <!-- <h2 class="heading-section">會員登入</h2> -->
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-12 col-lg-10">
            <div class="wrap d-md-flex">
              <div
                class="i-wrap-2 text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last"
              ></div>
              <div class="login-wrap p-4 p-lg-5">
                <div class="d-flex">
                  <div class="w-100">
                    <h2 class="mb-4" style="color:#2a507b">個人健康數據測驗</h2>
                  </div>
                </div>
                <form action="#" class="signin-form" method="post" enctype="multipart/form-data" autocomplete="off" onsubmit="validateForm2(event)">
                  <div class="form-group mb-3">
                    <label class="form-label" for="main-goal">主要目標</label>
                    <select name="main-goal" id="main-goal">
                      <option selected="true" disabled>==請選擇==</option>
                      <option value="muscle">我要增加肌肉</option>
                      <option value="weight_loss">我要瘦身減重</option>
                      <option value="health">我要保持健康</option>
                    </select>
                  </div>
                  <div class="form-group mb-3">
                    <label class="contact-label" for="nowWeight"
                      >現在體重</label
                    >
                    <input
                      type="text"
                      name="nowWeight"
                      id="nowWeight"
                      placeholder="請輸入體重"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label class="contact-label" for="goalWeight"
                      >目標體重</label
                    >
                    <input
                      type="text"
                      name="goalWeight"
                      id="goalWeight"
                      placeholder="請輸入體重"
                      required
                    />
                  </div>
                  <br />
                  <div class="form-group">
                    <button
                      type="submit"
                      class="form-control btn btn-primary submit px-3"
                    >
                      下一題
                    </button>
                  </div>
                  <div class="form-group d-md-flex">
                    <div class="w-50 text-left">
                      <!-- <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
										</label> -->
                    </div>
                    <!-- <div class="w-50 text-md-right">
                      <a href="#">忘記密碼</a>
                    </div> -->
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="/asset4/js/script.js"></script>
    <script src="/asset4/js/jquery.min.js"></script>
    <script src="/asset4/js/popper.js"></script>
    <script src="/asset4/js/bootstrap.min.js"></script>
    <script src="/asset4/js/main.js"></script>
    <script type="text/javascript"></script>
  </body>
</html>


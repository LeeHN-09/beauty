package com.example.demo.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DailyCalories;
import com.example.demo.Meal;
import com.example.demo.PasswordResetToken;
import com.example.demo.Users;
import com.example.demo.service.EatFoodCaloriesService;
import com.example.demo.service.UsersService;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
public class memberController {
	
	private static final Logger logger = LoggerFactory.getLogger(EatFoodCaloriesController.class);

    @Autowired
    private EatFoodCaloriesService efService;

    @Autowired
    private ObjectMapper objectMapper;
	
    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        Integer totalCalories = efService.getTotalCalories(session);
        model.addAttribute("totalCalories", totalCalories != null ? totalCalories : 0);

        // 序列化 dailyCalories 数据
        List<DailyCalories> dailyCalories = efService.getDailyCalories(session);
        
        int daysToShow = 7;
        if (dailyCalories.size() > daysToShow) {
            dailyCalories = dailyCalories.subList(dailyCalories.size() - daysToShow, dailyCalories.size());
        }
        try {
            String dailyCaloriesJson = objectMapper.writeValueAsString(dailyCalories);
            model.addAttribute("dailyCaloriesJson", dailyCaloriesJson);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Error serializing dailyCalories", e);
        }

        // 获取当前登录用户的用餐记录
        String email = (String) session.getAttribute("logInEmail");
        if (email != null) {
            List<Meal> userMeals = efService.getMealsByUserEmail(email);
            model.addAttribute("userMeals", userMeals);
        } else {
            model.addAttribute("userMeals", null);
            return "redirect:/api/caloriesPage";
        }

        return "dashboard"; // 返回 JSP 视图，没有前缀
    }
    
	@GetMapping("/ques1")
    public String ques() {
        return "question1";
    }
	@GetMapping("/test2")
    public String test() {
        return "login";
    }
	
	@GetMapping("/test3")
    public String test1() {
        return "login2";
    }

	
	@RequestMapping(value = "/views/**", method = RequestMethod.GET)
    public String showView(HttpServletRequest request) {
        // 获取请求的URI，并移除前缀
        String uri = request.getRequestURI();
        String viewName = uri.substring(uri.lastIndexOf("/views/") + 7);
        // 返回视图名
        return viewName;
}
	
	//============忘記密碼  start=============
		@Autowired
	    private UsersService usersService;
		private ServletRequest session;
		
		@GetMapping("/forgotPassword")
	    public String showForgotPasswordForm() {
	        return "forgotPassword";
	    }

	    @PostMapping("/forgotPassword")
	    public String processForgotPasswordForm(@RequestParam("email") String email, HttpServletRequest request) {
	        Users users = usersService.findUserByEmail(email);
	        if (users == null) {
	            // 用戶不存在的處理
	            return "redirect:/forgotPassword?error";
	        }

	        String token = UUID.randomUUID().toString();
	        usersService.createPasswordResetTokenForUser(users, token);
	        usersService.sendPasswordResetEmail(email, token);

	        return "redirect:/forgotPassword?success";
	    }

	    @GetMapping("/resetPassword")
	    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
	        PasswordResetToken resetToken = usersService.getPasswordResetToken(token);
	        if (resetToken == null || resetToken.isExpired()) {
	            // 無效或過期令牌的處理
	        	model.addAttribute("error", "Invalid or expired password reset token.");
	            return "reset-password-error";
	        }

	        model.addAttribute("token", token);
	        return "resetPassword";
	    }

	    @PostMapping("/resetPassword")
	    public String processResetPasswordForm(
	            @RequestParam("token") String token,
	            @RequestParam("newPassword") String newPassword,
	            @RequestParam("confirmPassword") String confirmPassword,
	            Model model) {
	    	
	        if (!newPassword.equals(confirmPassword)) {
	            // 密碼不匹配的處理
	        	model.addAttribute("error", "Passwords do not match.");
	            return "resetPassword";
	        }
	        PasswordResetToken resetToken = usersService.getPasswordResetToken(token);
	        
	        if (resetToken == null || resetToken.isExpired()) {
	            model.addAttribute("error", "Invalid or expired password reset token.");
	            return "reset-password-error";
	        }
	        //成功返回登入畫面
	        Users users = resetToken.getUsers();
	        usersService.changeUserPassword(users, newPassword);
	        return "redirect:/test2";
	    }
	  //============忘記密碼  end=============
	    @GetMapping("/memberindex")
	    public String test5() {
	        return "index";
	    }
	    @GetMapping("/membergoal")
	    public String test6() {
	        return "goal";
	    }
	    @GetMapping("/memberreport")
	    public String test7() {
	        return "bodyreport";
	    }

	    @GetMapping("/test6")
	    public String user(@AuthenticationPrincipal OAuth2User principal) {
	        // 可以從 principal 取得使用者資訊
	        System.out.println("User's email: " + principal.getAttribute("email"));
	        return "dashboard";
	    }
	    
	   @GetMapping("/elves")
	   public String getMethodName() {
	   	return "th/elves";
	   }
	   @GetMapping("/dressup")
	   public String getMethodName1() {
	   	return "th/dressup";
	   }
	   
	   @GetMapping("/dressup2")
	   public String getMethodName2() {
	   	return "th/dressup2";
	   }
	   
	   @GetMapping("/test4")
	    public String test2() {
	        return "loginr";
	    }
	   @GetMapping("/ques1r")
	    public String ques1() {
	        return "question1r";
	    }
	   
	   
}
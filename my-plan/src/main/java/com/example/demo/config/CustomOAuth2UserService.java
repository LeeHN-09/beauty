package com.example.demo.config;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.demo.Users;
import com.example.demo.service.FitnessGoalService;
import com.example.demo.service.UsersService;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
	
    @Autowired
    private FitnessGoalService fitnessGoalService;
    
    @Autowired
    private HttpSession session;
	
	
    @Autowired
    private UsersService usersService;

    private final DefaultOAuth2UserService delegate = new DefaultOAuth2UserService();
    
    public CustomOAuth2UserService() {
        System.out.println("CustomOidcUserService instantiated");
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    	OAuth2User oidcUser = delegate.loadUser(userRequest);
        
    	System.out.println("CustomOidcUserService: loadUser method called");
        
        String email = oidcUser.getAttribute("email");
       //從session獲取部分已完成信息的用戶
        Users sessionUser = (Users) session.getAttribute("response1");

        if (sessionUser != null) {
            // 更新现有用户记录
            sessionUser.setEmail(email);
            usersService.saveUser(sessionUser);
        } else {
            // 检查数据库中是否存在用户
        	Users existingUser = usersService.getUserByEmail(email);
            if (existingUser == null) {
                // 用户不存在，创建新用户
                Users newUser = new Users();
                newUser.setEmail(email);
                fitnessGoalService.saveUser(newUser);
            }
          }
        session.removeAttribute("response1");
        session.removeAttribute("response");
        
        Users users = usersService.getUserByEmail(email);

        // 將用戶資訊設置到 session 中
        session.setAttribute("logInEmail", users.getEmail());
        session.setAttribute("loginId", users.getUser_id());
        // 重定向到前端，帶上 email 和 loginId
        String redirectUrl = "http://localhost:8080/dashboard?email=" + email + "&loginId=" + users.getUser_id();
        try {
			((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse().sendRedirect(redirectUrl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
		return oidcUser;
		}
    

    private void saveOrUpdateUser(String email, String name) {
        Users existingUser = usersService.getUserByEmail(email);

        if (existingUser == null) {
            // 用户不存在，创建新用户
            Users newUser = new Users();
            newUser.setEmail(email);
            newUser.setReal_name(name);
            usersService.saveUser(newUser);
        }
    }
}
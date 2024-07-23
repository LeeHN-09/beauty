package com.example.demo.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

import com.example.demo.Users;
import com.example.demo.service.FitnessGoalService;
import com.example.demo.service.UsersService;

@Service
public class CustomOidcUserService extends OidcUserService {

    @Autowired
    private UsersService usersService;
    @Autowired
    private FitnessGoalService fitnessGoalService;
    
    @Autowired
    private HttpSession session;
    
    public CustomOidcUserService() {
        System.out.println("CustomOidcUserService instantiated");
    }

    @Override
    public OidcUser loadUser(OidcUserRequest userRequest) {
        OidcUser oidcUser = super.loadUser(userRequest);
        
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

        return oidcUser;
    }

   
}

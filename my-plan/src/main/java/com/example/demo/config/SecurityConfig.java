package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;

import org.springframework.security.web.SecurityFilterChain;



@Configuration
@EnableWebSecurity
public class SecurityConfig {

	 @Bean
	    public SecurityFilterChain securityFilterChain(HttpSecurity http, CustomOAuth2UserService customOidcUserService) throws Exception {
	        http
	            .authorizeRequests(authorizeRequests -> 
	                authorizeRequests
	                    .antMatchers("/test2","/logins","/oauth2/**","/views/**","/index","/**").permitAll()
	                    //登入介面  用email加密碼發送登入請求   所有與 OAuth2 認證相關的 URL  permitAll()所有用戶（包括未經身份驗證的用戶）都可以訪問這些 URL。
	                    //估計要加入一開始網頁
	                    .anyRequest().authenticated() // 其他所有請求都需要身份驗證
	            )
	            //用email+密碼登入
	            .formLogin(formLogin ->
                formLogin
                    .loginPage("/test2")//登入畫面
                    .defaultSuccessUrl("/test1", true)//登入成功後的畫面
                    .permitAll()
            )
	            .oauth2Login(oauth2Login -> 
	                oauth2Login
	                    
	                    .userInfoEndpoint(userInfoEndpoint -> 
	                        userInfoEndpoint
	                           	.userService(customOidcUserService)
	                    )
	                    .defaultSuccessUrl("/test1", true)//第三方登入後導入的網頁
	                    .failureUrl("/loginFailure")
	            )
	            .logout(logout -> 
	                logout
	                    .logoutSuccessUrl("/test2")
	                    .permitAll()
	            )
	            .csrf().disable();//訪止CSRF攻擊

	        return http.build();
	    }

	    
	    @Bean
	    public WebSecurityCustomizer webSecurityCustomizer() {
	        return web -> web.ignoring().antMatchers( "/asset4/**","/about/**");
	    }
	
}

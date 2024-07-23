package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.PasswordResetToken;

public interface PasswordResetTokenDao extends JpaRepository<PasswordResetToken, Integer>{
	 PasswordResetToken findByToken(String token);
}

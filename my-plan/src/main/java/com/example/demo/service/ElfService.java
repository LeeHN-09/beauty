package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.repository.ElfDao;

import com.example.demo.repository.UsersDao;

import dto.ElfDTO;
import dto.ElfRequestDTO;
import dto.ElfWithAccessoryImage;

import com.example.demo.Elf;
import com.example.demo.ElfType;
import com.example.demo.Users;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

@Service
public class ElfService {

    @Autowired
    private ElfDao elfDao;


    @Autowired
    private UsersDao usersDao;

    public Elf saveElf(Integer typeId, Integer userId) {
        Users users = usersDao.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " + userId));


        Elf elf = new Elf();
        elf.setTypeId(typeId);
        elf.setUsers(users);
        elf.setCreatedAt(LocalDateTime.now());
        
        return elfDao.save(elf);
    }
    
    public List<ElfDTO> findTypeIdAndElfImageByUserId(Integer userId) {
        return elfDao.findTypeIdAndElfImageByUserId(userId);
    }

	public Elf saveElf(Elf elf) {
		// TODO Auto-generated method stub
		return null;
	}
    
	
	public Elf createElfForUser(Users user) {
        Elf elf = new Elf();
        elf.setUsers(user);
        return elfDao.save(elf);
    }
	
	 public Integer getAccessoryIdByUserId(Integer userId) {
	        // 根据 userId 查询对应的 accessoryId
	        Elf elf = elfDao.findByUserId(userId);
	        if (elf == null) {
	            throw new IllegalArgumentException("No elf found for user ID: " + userId);
	        }
	        return elf.getAccessoryId();
	    }
	
//	public ElfRequestDTO getElfByUserIdAndAccessId(Integer userId) {
//        // 根据 userId 和 accessoryId 获取 ELF 信息
//        ElfWithAccessoryImage elfWithAccessoryImage = elfDao.findFirstByUserIdAndAccessId(userId);
//        if (elfWithAccessoryImage == null) {
//            throw new IllegalArgumentException("No elf found for user ID: " + userId );
//        }
//        ElfRequestDTO response = new ElfRequestDTO();
////        response.setTypeId(elfWithAccessoryImage.getElf().getTypeId());
//        response.setElfImage(elfWithAccessoryImage.getAccessoryImage());
//        return response;
//    }
	
	public String getAccessoryImage(Integer userId) {
	    String accessoryImage = elfDao.findFirstByUserIdAndAccessId(userId);
	    if (accessoryImage == null) {
	        throw new ResponseStatusException(HttpStatus.NO_CONTENT, "No content found for the given user ID");
	    }
	    return accessoryImage;
	}
	
	public ElfService(ElfDao elfDao) {
        this.elfDao = elfDao;
    }

    public boolean saveAccessoryId(Integer userId, Integer accessoryId) {
        try {
            // 假设 userId 是 Users 实体中的主键
            Users user = new Users();
            user.setUser_id(userId);

            // 查询最新的 Elf 记录
            Elf elf = elfDao.findTopByUsersOrderByCreatedAtDesc(user);

            if (elf != null) {
                // 更新 accessoryId
                elf.setAccessoryId(accessoryId);
                elfDao.save(elf); // 保存更新后的 Elf 对象
                return true;
            } else {
                throw new EntityNotFoundException("Elf not found for userId: " + userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
		  
	  
	
	

}


package com.example.demo.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.Elf;
import com.example.demo.ElfType;
import com.example.demo.Users;
import com.example.demo.repository.UserDao;
import com.example.demo.service.ElfService;

import dto.ElfDTO;
import dto.ElfRequestDTO;

@RestController
@RequestMapping("/api")
public class ElfController {

    @Autowired
    private ElfService elfService;
    
    @Autowired
    private UserDao userDao;

    @PostMapping("/elves")
    public ResponseEntity<String> saveElf(@RequestBody ElfRequestDTO request) {
        Integer typeId = request.getTypeId();
        Integer userId = request.getUserId(); // Assuming userId is Integer type

        if (userId == null || typeId == null) {
            return ResponseEntity.badRequest().body("typeId and userId are required");
        }

        // Assuming saveElf method in service accepts Integer userId
        Elf savedElf = elfService.saveElf(typeId, userId);
        return ResponseEntity.ok("Elf saved successfully with ID: " + savedElf.getId());
    }
    
//    @GetMapping("/elves/{userId}")
//    public ResponseEntity<ElfRequestDTO> getElfByUserId(@PathVariable Integer userId) {
//        try {
//            // 根据 userId 查询对应的 accessoryId
////            Integer accessoryId = elfService.getAccessoryIdByUserId(userId);
//            
//            // 使用 userId 和 accessoryId 获取 ELF 信息
//            ElfRequestDTO response = elfService.getElfByUserIdAndAccessId(userId);
//            
//            return ResponseEntity.ok(response);
//        } catch (Exception e) {
//            // Catch all exceptions and return 500 error
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
//        }
//    }
    @GetMapping("/elves/{userId}")
    public ResponseEntity<String> getAccessoryImage(@PathVariable Integer userId) {
        try {
            String accessoryImage = elfService.getAccessoryImage(userId);
            return ResponseEntity.ok(accessoryImage);
        } catch (ResponseStatusException e) {
            return ResponseEntity.status(e.getStatus()).body(e.getReason());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred");
        }
    }
    
    
    @GetMapping("/byUserId/{userId}")
    public ResponseEntity<List<ElfDTO>> findTypeIdAndElfImageByUserId(@PathVariable Integer userId) {
        try {
        	        	
            List<ElfDTO> elfTypes = elfService.findTypeIdAndElfImageByUserId(userId);
            for(ElfDTO elfType:elfTypes) {
            	System.out.println(elfType);
            }
            return ResponseEntity.ok(elfTypes);
        } catch (Exception e) {
        	e.printStackTrace();
            // Catch all exceptions and return 500 error
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    
    @PostMapping("/saveAccessoryId")
    public ResponseEntity<?> saveAccessoryId(@RequestBody Map<String, Integer> payload) {
      Integer accessoryId = payload.get("accessory_id");
      Integer userId = payload.get("user_id").intValue();
      boolean success = elfService.saveAccessoryId(userId, accessoryId);
      if (success) {
        return ResponseEntity.ok(Collections.singletonMap("success", true));
      } else {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("success", false));
      }
    }
    
    
}

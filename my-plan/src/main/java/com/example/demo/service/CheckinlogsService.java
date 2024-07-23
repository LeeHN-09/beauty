package com.example.demo.service;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Checkinlogs;
import com.example.demo.repository.CheckinDao;

@Service
public class CheckinlogsService {
	
	@Autowired
	private CheckinDao checkinDao;
	
	public Checkinlogs addCheckinlogs(Checkinlogs checkinlogs) {
		return checkinDao.save(checkinlogs);
	}
	
	public List<Checkinlogs> getCheckinLogsByUserId(int userId) {
        return checkinDao.findByUserId(userId);
    }
	
	 public boolean hasCheckedInToday(int userId) {
	        System.out.println(checkinDao.existsByUserIdAndCheckinDateToday(userId));
		 return checkinDao.existsByUserIdAndCheckinDateToday(userId);
	    }
}

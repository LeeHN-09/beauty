package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ContactUs;
import com.example.demo.repository.ContactUsDao;


@Service
public class ContactUsService {

	
	@Autowired
    private ContactUsDao contactUsDao;

    public void saveContactUs(ContactUs contactUs) {
    	contactUsDao.save(contactUs);
    }
}

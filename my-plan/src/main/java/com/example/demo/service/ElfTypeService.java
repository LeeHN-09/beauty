package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ElfTypeDao;
import com.example.demo.ElfType;

@Service
public class ElfTypeService {
    @Autowired
    private ElfTypeDao elfTypeDao;

    public List<ElfType> getAllElfTypes() {
        return elfTypeDao.findAll();
    }

    public ElfType getElfTypeById(Integer id) {
        return elfTypeDao.findById(id).orElse(null);
    }
}

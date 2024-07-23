package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.ElfType;
import com.example.demo.service.ElfTypeService;

@RestController
@RequestMapping("/api/elftypes")
public class ElfTypeController {

    @Autowired
    private ElfTypeService elfTypeService;

    @GetMapping
    public List<ElfType> getAllElfTypes() {
        return elfTypeService.getAllElfTypes();
    }

    @GetMapping("/{id}")
    public ElfType getElfTypeById(@PathVariable Integer id) {
        return elfTypeService.getElfTypeById(id);
    }
    
    
}


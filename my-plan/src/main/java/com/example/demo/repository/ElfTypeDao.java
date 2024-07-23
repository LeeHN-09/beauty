package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.ElfType;

@Repository
public interface ElfTypeDao extends JpaRepository<ElfType, Integer>{

}

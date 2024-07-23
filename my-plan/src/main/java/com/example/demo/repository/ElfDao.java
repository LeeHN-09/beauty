package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.example.demo.Elf;
import com.example.demo.ElfType;
import com.example.demo.Users;

import dto.ElfDTO;
import dto.ElfRequestDTO;
import dto.ElfWithAccessoryImage;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface ElfDao extends JpaRepository<Elf, Integer> {

	Elf findTopByUsersOrderByCreatedAtDesc(Users users);

	
	@Query(value="SELECT * FROM elves WHERE user_id = :userId", nativeQuery = true)
	Elf findByUserId(Integer userId);
	
	@Query(value="SELECT e.accessory_id FROM elves e WHERE e.user_id = :userId ORDER BY e.created_at DESC LIMIT 1", nativeQuery = true)
	Elf findByUserId2(Integer userId);
	
	
    // 根据用户的user_id查询对应的Elf信息
	@Query(value = "SELECT a.accessory_image " +
            "FROM ELVES e JOIN Accessories a ON e.accessory_id = a.accessory_id " +
            "WHERE e.user_id = :userId " +
            "ORDER BY e.created_at DESC " +
            "LIMIT 1", nativeQuery = true)
String findFirstByUserIdAndAccessId(@Param("userId") Integer userId);

	
	
    // 如果需要额外的字段，比如elfImage和typeId，可以自定义查询

//	@Query("SELECT et.elfImage, et.name FROM ElfType et JOIN Elf e ON et.typeId = e.elfType JOIN Users u ON e.users = u.user_id WHERE u.user_id = :userId ORDER BY e.createdAt DESC")
//	List<ElfType> findTypeIdAndElfImageByUserId(@Param("userId") Integer userId);
	// SELECT * from  users u LEFT join elves e on u.user_id = e.user_id 
	//left JOIN elftypes et on e.type_id=et.type_id;
	@Query("SELECT new dto.ElfDTO(et.elfImage,et.name) FROM Users u left join Elf e on u.user_id = e.users.user_id  "
			+ " left join ElfType et on et.typeId = e.typeId where u.user_id = :userId")
	List<ElfDTO> findTypeIdAndElfImageByUserId(@Param("userId") Integer userId);

	
//	@Query("SELECT et.elf_image, et.name FROM ElfType et JOIN Elf e ON et.type_id = e.type_id JOIN Users u on e.users.user_id = u.user_id WHERE u.userId = :userId ORDER BY e.createdAt DESC")
//	List<ElfType> findTypeIdAndElfImageByUserId(@Param("userId") Integer userId);

	
	//	@Query("SELECT new dto.ElfRequestDTO(et.typeId, u.userId, et.elfImage, et.name) " +
//		       "FROM Elf e " +
//		       "JOIN e.elfType et " +
//		       "JOIN e.users u " +
//		       "WHERE u.userId = :userId " +
//		       "ORDER BY e.createdAt DESC")
//		List<ElfRequestDTO> findTypeIdAndElfImageByUserId(@Param("userId") Integer userId);


}


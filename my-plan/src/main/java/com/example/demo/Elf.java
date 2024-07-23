package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.PrePersist;
import java.time.LocalDateTime;

@Entity
@Table(name = "elves")
public class Elf {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "elf_id")
    private Integer id;

    
    @Column(name = "type_id")
    private Integer typeId = 1;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users users;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "accessory_id")
    private Integer accessoryId = 13;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

  

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = LocalDateTime.now();
    }
    
    

    public Integer getAccessoryId() {
		return accessoryId;
	}

	public void setAccessoryId(Integer accessoryId) {
		this.accessoryId = accessoryId;
	}





	public Elf(Integer id, Integer typeId, Users users, LocalDateTime createdAt, Integer accessoryId) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.users = users;
		this.createdAt = createdAt;
		this.accessoryId = accessoryId;
	}

	public Elf() {
		super();
	}
    
    
}

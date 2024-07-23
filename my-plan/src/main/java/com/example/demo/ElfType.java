package com.example.demo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "elftypes")
public class ElfType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_id")
    private Integer typeId;

    private String name;

    @Lob
    @Column(name = "elf_image", columnDefinition = "LONGTEXT")
    private String elfImage;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getElfImage() {
        return elfImage;
    }

    public void setElfImage(String elfImage) { 
        this.elfImage = elfImage;
    }
    
    
    
    public ElfType() {	
	}
    public ElfType(Integer typeId) {
		this.typeId = typeId;
	}

	@Override
    public String toString() {
        return "ElfType [typeId=" + typeId + ", name=" + name + ", elfImage=" + elfImage + "]";
    }
}

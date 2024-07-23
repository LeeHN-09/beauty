package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "accessories")
public class Accessories {
	 @Id
	    private Integer accessory_id;
	    private String accessory_image;
		public Integer getAccessory_id() {
			return accessory_id;
		}
		public void setAccessory_id(Integer accessory_id) {
			this.accessory_id = accessory_id;
		}
		public String getAccessory_image() {
			return accessory_image;
		}
		public void setAccessory_image(String accessory_image) {
			this.accessory_image = accessory_image;
		}

	    
}

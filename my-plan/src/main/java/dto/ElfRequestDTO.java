package dto;



public class ElfRequestDTO {
    private Integer typeId;
    private Integer userId;
    private String elfImage;
    private String name; // 添加了精灵的名字属性
    
  


	// Getter and Setter methods for new property
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Existing Getter and Setter methods
    

    public Integer getUserId() {
        return userId;
    }


	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getElfImage() {
        return elfImage;
    }

    public void setElfImage(String elfImage) {
        this.elfImage = elfImage;
    }
}


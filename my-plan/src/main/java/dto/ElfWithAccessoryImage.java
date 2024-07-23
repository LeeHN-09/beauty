package dto;

import com.example.demo.Elf;

public class ElfWithAccessoryImage {
	private Elf elf;
    private String accessoryImage;

    public ElfWithAccessoryImage(Elf elf, String accessoryImage) {
        this.elf = elf;
        this.accessoryImage = accessoryImage;
    }

	public Elf getElf() {
		return elf;
	}

	public void setElf(Elf elf) {
		this.elf = elf;
	}

	public String getAccessoryImage() {
		return accessoryImage;
	}

	public void setAccessoryImage(String accessoryImage) {
		this.accessoryImage = accessoryImage;
	}
    
    
}

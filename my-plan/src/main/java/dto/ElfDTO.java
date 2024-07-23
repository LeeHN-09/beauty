package dto;

public class ElfDTO {
	  private String elfImage;
	    private String name;
		public String getElfImage() {
			return elfImage;
		}
		public void setElfImage(String elfImage) {
			this.elfImage = elfImage;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public ElfDTO(String elfImage, String name) {
			this.elfImage = elfImage;
			this.name = name;
		}
		@Override
		public String toString() {
			return "ElfDTO [elfImage=" + elfImage + ", name=" + name + "]";
		}
		
		
	    
}

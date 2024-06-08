package dto;

import java.io.Serializable;

public class Property implements Serializable {
	
	private static final long serialVersionUID=-4274700572038677000L;
	
	private String propertyID; // 매물 ID
	private String name; // 매물 이름
	private String unitPrice; // 매물 가격
	private String description; // 설명
	private String district; // 위치
	private String area; // 면적
	
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	private String releaseDate; // 매물 나온 날짜
	private String condition; // 매매, 전세, 월세
	private String filename; // 사진
	private boolean bookmark; // 찜하기
	
    public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	private String city; // 시 정보 추가

	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Property() {
		super();
	}
	
	public Property(String propertyID, String name, String unitPrice) {
		this.propertyID=propertyID;
		this.name=name;
		this.unitPrice=unitPrice;
	}

	public String getPropertyID() {
		return propertyID;
	}

	public void setPropertyID(String propertyID) {
		this.propertyID = propertyID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public boolean getBookmark() {
		return bookmark;
	}

	public void setBookmark(boolean bookmark) {
		this.bookmark = bookmark;
	}
}
package com.medical.dto;

public class SupplyDto {
	private int id;
	private String title;
	private String code;
	private int price;
	private String img;
	private int plural;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public SupplyDto(int id, String title, String code, int price, String img, int plural) {
		super();
		this.id = id;
		this.title = title;
		this.code = code;
		this.price = price;
		this.img = img;
		this.plural = plural;
	}

	public SupplyDto() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPlural() {
		return plural;
	}

	public void setPlural(int plural) {
		this.plural = plural;
	}

	@Override
	public String toString() {
		return "SupplyDto [id=" + id + ", title=" + title + ", code=" + code + ", img=" + img + ", plural=" + plural
				+ "]";
	}

}

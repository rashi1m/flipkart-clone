package com.entities;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pTitle;
	private String pDescription;
	private int pPrice;
	private String pPhoto;
	private int pDiscount;
	private int pQuantity;
	
	@ManyToOne
	private Category category;
	
	
	public Products(String pTitle, String pDescription, int pPrice, String pPhoto, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pTitle = pTitle;
		this.pDescription = pDescription;
		this.pPrice = pPrice;
		this.pPhoto = pPhoto;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}
	
	
	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getpTitle() {
		return pTitle;
	}


	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}


	public String getpDescription() {
		return pDescription;
	}


	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public String getpPhoto() {
		return pPhoto;
	}


	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}


	public int getpDiscount() {
		return pDiscount;
	}


	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}


	public int getpQuantity() {
		return pQuantity;
	}


	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public Products() {
		
	}


	@Override
	public String toString() {
		return "Products [pId=" + pId + ", pTitle=" + pTitle + ", pDescription=" + pDescription + ", pPrice=" + pPrice
				+ ", pPhoto=" + pPhoto + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + ", category="
				+ category + "]";
	}
	
	//calculate price after discount
	
	public int getPriceAfterApplyingDiscount() {
		
		int d=(int)((this.getpDiscount()/100.0)*this.getpPrice());
		return this.getpPrice()-d;
		
		
		
	}
}

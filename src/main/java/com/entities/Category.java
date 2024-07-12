package com.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int catId;
	private String catTitle;
	private String catDescription;
	@OneToMany(mappedBy= "category")
	private List<Products> products = new ArrayList<>();
	public Category(int catId, String catTitle, String catDescription) {
		
		this.catId = catId;
		this.catTitle = catTitle;
		this.catDescription = catDescription;
	}
	public Category(String catTitle, String catDescription , List<Products> products) {
		
		this.catTitle = catTitle;
		this.catDescription = catDescription;
		
	}
	
	public Category() {
	
		
	}
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatTitle() {
		return catTitle;
	}
	public void setCatTitle(String catTitle) {
		this.catTitle = catTitle;
	}
	public String getCatDescription() {
		return catDescription;
	}
	public void setCatDescription(String catDescription) {
		this.catDescription = catDescription;
	}
	public List<Products> getProducts() {
		return products;
	}
	public void setProducts(List<Products> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "Category [catId=" + catId + ", catTitle=" + catTitle + ", catDescription=" + catDescription
				+ ", products=" + products + "]";
	}
	
	
}

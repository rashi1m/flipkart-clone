package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Cart;
import com.entities.Category;
import com.entities.Products;

public class ProductDao {
     
	private SessionFactory factory;
	
	public ProductDao(SessionFactory factory)
	{
		this.factory= factory;
	}
	public boolean saveProduct(Products product) {
		boolean f= false;
		try {
			
			Session session = this.factory.openSession();
			Transaction tx =session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
			
			f=false;
		}
		
		return f;
	}
	
	
	//get all products
	
	public List<Products> getAllProducts(){
		
		Session s = this.factory.openSession();
		Query q =s.createQuery("from Products");
		
		List<Products> list =q.list();
		return list;
	}
	
	
	
public List<Products> getAllProductsById(int cid){
		
		Session s = this.factory.openSession();
		Query query =s.createQuery("from Products as p where p.category.catId = :id ");
		query.setParameter("id",cid );
		
		List<Products> list =query.list();
		return list;
	}

public List<Cart> getCartProducts(ArrayList<Cart> cartList){
	List<Cart> product = new ArrayList<Cart>();
	
	try {
		if(cartList.size()>0) {
	for(Cart item :cartList) {
	Session s = this.factory.openSession();
	Query query =s.createQuery("from Products ");

	Cart row = new Cart();
	
	row.setpId(1);
	
	row.setCategory(null);
	row.getPriceAfterApplyingDiscount();
	row.setpQuantity(1);
	product.add(row);
	
	
	
		}
		}
	}catch(Exception e)
	{
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return product;
	
	
}
}

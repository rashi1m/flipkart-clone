package com.Dao;

import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.Users;

public class userDao {
 private SessionFactory factory;
 
 public userDao(SessionFactory factory) {
	 this.factory=factory;
	 
	 
 }
 public Users getUserByEmailAndPassword(String userEmail,String userPassword) {
	 Users user=null;
	 try {
		 
		 String query="from Users where userEmail=:x and userPassword=:p";
		Session session= this.factory.openSession();
		Query q= session.createQuery(query);
		
		
		q.setParameter("x",userEmail);
		q.setParameter("p",userPassword);
		user=(Users)q.uniqueResult();
		
		session.close();
		
		
		
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	 return user;
 }
}

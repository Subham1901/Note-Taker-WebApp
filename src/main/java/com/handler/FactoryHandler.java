package com.handler;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryHandler {
	
	public static SessionFactory factory;
	
	public static SessionFactory getFact() {
		
		if(factory==null) {
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}

}

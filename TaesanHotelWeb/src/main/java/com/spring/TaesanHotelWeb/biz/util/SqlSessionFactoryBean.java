package com.spring.TaesanHotelWeb.biz.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null; 
	static { //static �ʱ�ȭ�� ����ϸ� ��ó�� static�� �θ��»�Ȳ�� ���� �ڵ����� �ʱ�ȭ�ȴ�.
		try {
			if(sessionFactory == null) {
				Reader reader = Resources.getResourceAsReader("sql/sql-map-config.xml");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSqlSessionInstance() {
		return sessionFactory.openSession();
	}
}

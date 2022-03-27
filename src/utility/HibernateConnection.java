package utility;

import java.util.*;


import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import bean.Activity;
import bean.Faculty;
import bean.Register;
import bean.RegisterActivity;
import bean.University;

public class HibernateConnection {
	static String url = "jdbc:mysql://localhost:3306/mju4jobb?characterEncoding=UTF-8";
	static String uname = "root";
	static String pwd = "Fluke123";
	public static SessionFactory sessionFactory;
	public static SessionFactory doHibernateConnection() {
	Properties database = new Properties();
//	database.setProperty("hibernate.hbm2ddl.auto","create");
	database.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
	database.setProperty("hibernate.connection.username", uname);
	database.setProperty("hibernate.connection.password", pwd);
	database.setProperty("hibernate.connection.url", url);
	database.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL57Dialect");
	Configuration cfg = new Configuration().setProperties(database).addPackage("bean")
					.addAnnotatedClass(Faculty.class)
					.addAnnotatedClass(University.class)
					.addAnnotatedClass(Register.class)
					.addAnnotatedClass(RegisterActivity.class)
					.addAnnotatedClass(Activity.class)
					;
	StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	sessionFactory = cfg.buildSessionFactory(ssrb.build());
	return sessionFactory;
	}
}

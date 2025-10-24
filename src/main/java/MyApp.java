package com.uteshop.controller;

import org.apache.catalina.startup.Tomcat;
import java.io.File;

public class MyApp {
    public static void main(String[] args) throws Exception {
        int port = Integer.parseInt(System.getenv().getOrDefault("PORT", "8080"));
        
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(port);

        // Đặt thư mục chứa JSP / web.xml
        String webappDir = new File("src/main/webapp/").getAbsolutePath();
        tomcat.addWebapp("/", webappDir);

        System.out.println("Starting Tomcat on port " + port);
        tomcat.start();
        tomcat.getServer().await();
    }
}
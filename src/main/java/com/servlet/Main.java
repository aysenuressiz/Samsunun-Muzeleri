package com.servlet;

import org.apache.catalina.startup.Tomcat;
import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        String port = System.getenv("PORT");
        if (port == null) {
            port = "8080";
        }
        
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(port));
        
        String webappDirLocation = "src/main/webapp/";
        tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());
        
        tomcat.start();
        tomcat.getServer().await();
    }
}

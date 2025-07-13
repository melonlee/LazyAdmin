package com.lazy.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * LazyAdmin 启动类
 * 
 * @author Melon
 * @version 2.0.0
 */
@SpringBootApplication
@EnableCaching
@EnableTransactionManagement
public class LazyAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(LazyAdminApplication.class, args);
    }
}

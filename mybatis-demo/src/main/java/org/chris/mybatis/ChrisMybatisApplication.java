package org.chris.mybatis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.chris.*")
public class ChrisMybatisApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChrisMybatisApplication.class, args);
    }
}

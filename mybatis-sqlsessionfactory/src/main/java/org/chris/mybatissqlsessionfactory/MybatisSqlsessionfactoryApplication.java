package org.chris.mybatissqlsessionfactory;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.chris.*")
public class MybatisSqlsessionfactoryApplication {

    public static void main(String[] args) {
        SpringApplication.run(MybatisSqlsessionfactoryApplication.class, args);
    }
}

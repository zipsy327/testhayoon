package org.example.academyproject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"controllerH.*", "controllerW.*", "data.*", "org.example.academyproject", "naver.cloud"})
@MapperScan({"data.mapperH", "data.mapperW"})
public class AcademyProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(AcademyProjectApplication.class, args);
	}

}

package com.ustore.ustore;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;


@SpringBootApplication
@EntityScan("com.ustore.models" )
public class UstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(UstoreApplication.class, args);
	}

}

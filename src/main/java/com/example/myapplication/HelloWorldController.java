package com.example.myapplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    private int counter = 0;

    private static final Logger logger = LoggerFactory.getLogger(HelloWorldController.class);

    @GetMapping("/")
    public String helloWorld() {
        logger.info("Received request for /");
        counter++;
        return "Hello World -- counter: " + counter;
    }

    @GetMapping("/health")
    public String healthCheck() {
        logger.info("Received request for /health");
        return "Application is running";
    }
}

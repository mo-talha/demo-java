package com.example.demo;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public ResponseEntity<String> sayHello(){
        return new ResponseEntity<>("Hello World", HttpStatus.OK);
    }

    @GetMapping("/whats-up")
    public ResponseEntity<String> sayWhatsUp(){
        return new ResponseEntity<>("What's Up", HttpStatus.OK);
    }
}

package com.example.demo.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@RequestMapping(path = "/v1/test", produces = MediaType.APPLICATION_JSON_VALUE)
public class TestController {

    @GetMapping(path = "random_number")
    public ResponseEntity<String> getRandomNumber(){
        return ResponseEntity.ok(String.valueOf(new Random().nextInt(0, 1_000)));
    }
}

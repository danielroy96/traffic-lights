package com.droy.trafficlights.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorPageController {

    @GetMapping("/broken")
    public String broken() {
        return "error-page";
    }

}

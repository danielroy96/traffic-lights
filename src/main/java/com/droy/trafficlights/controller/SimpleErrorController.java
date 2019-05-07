package com.droy.trafficlights.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/error")
public class SimpleErrorController implements ErrorController {


    @Autowired
    public SimpleErrorController() {}

    @Override
    public String getErrorPath() {
        return "/error";
    }

    @RequestMapping
    public RedirectView error(){
        return new RedirectView("/broken");
    }
}
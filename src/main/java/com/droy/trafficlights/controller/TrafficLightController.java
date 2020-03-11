package com.droy.trafficlights.controller;

import com.droy.trafficlights.entity.TrafficLightStatusEntity;
import com.droy.trafficlights.enumeration.TrafficLight;
import com.droy.trafficlights.service.TrafficLightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Date;

@Controller
public class TrafficLightController {

    private TrafficLightService trafficLightService;

    @Autowired
    public TrafficLightController(TrafficLightService trafficLightService) {
        this.trafficLightService = trafficLightService;
    }

    @GetMapping({"/", "/view"})
    public String trafficLightView(Model model) {
        model.addAttribute("trafficLights", trafficLightService.getTrafficLights());
        return "traffic-lights";
    }

    @GetMapping("/{id}/edit")
    public String trafficLightEdit(@PathVariable String id,
                                   Model model) {
        model.addAttribute("trafficLight", trafficLightService.getTrafficLight(Integer.parseInt(id)));
        return "edit-traffic-light";
    }

    @PostMapping("/{id}/edit")
    public RedirectView trafficLightEditPost(@PathVariable int id,
                                             @ModelAttribute("user") String user,
                                             @ModelAttribute("trafficLight") String trafficLight,
                                             @ModelAttribute("message") String message,
                                             @ModelAttribute("workingFromHome") String workingFromHome,
                                             @ModelAttribute("awayFromKeyboard") String awayFromKeyboard,
                                             Model model) {
        boolean workingFromHomeBoolean = false;
        if (workingFromHome.equals("on")) {
            workingFromHomeBoolean = true;
        }
        boolean awayFromKeyboardBoolean = false;
        if (awayFromKeyboard.equals("on")) {
            awayFromKeyboardBoolean = true;
        }
        trafficLightService.updatetrafficLight(
                id,
                user,
                TrafficLight.valueOf(trafficLight),
                message,
                workingFromHomeBoolean,
                awayFromKeyboardBoolean
        );
        model.addAttribute("trafficLights", trafficLightService.getTrafficLights());
        return new RedirectView("/");
    }

    @PostMapping("/{id}/delete")
    public RedirectView trafficLightDeletePost(@PathVariable int id) {
        trafficLightService.deleteTrafficLight(id);
        return new RedirectView("/");
    }

    @GetMapping("/create")
    public String trafficLightCreate(Model model) {
        model.addAttribute("trafficLight", new TrafficLightStatusEntity(
                "",
                TrafficLight.GREEN,
                "",
                false,
                false,
                new Date()));
        return "edit-traffic-light";
    }

    @PostMapping("/create")
    public RedirectView trafficLightCreatePost(@ModelAttribute("user") String user,
                                               @ModelAttribute("trafficLight") String trafficLight,
                                               @ModelAttribute("message") String message,
                                               @ModelAttribute("workingFromHome") String workingFromHome,
                                               @ModelAttribute("awayFromKeyboard") String awayFromKeyboard,
                                               Model model) {
        boolean workingFromHomeBoolean = false;
        if (workingFromHome.equals("on")) {
            workingFromHomeBoolean = true;
        }
        boolean awayFromKeyboardBoolean = false;
        if (awayFromKeyboard.equals("on")) {
            awayFromKeyboardBoolean = true;
        }
        trafficLightService.createTrafficLight(
                user,
                TrafficLight.valueOf(trafficLight),
                message,
                workingFromHomeBoolean,
                awayFromKeyboardBoolean
        );
        return new RedirectView("/");
    }

}

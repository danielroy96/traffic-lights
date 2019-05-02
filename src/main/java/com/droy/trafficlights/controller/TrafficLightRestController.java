package com.droy.trafficlights.controller;

import com.droy.trafficlights.entity.TrafficLightStatusEntity;
import com.droy.trafficlights.service.TrafficLightService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TrafficLightRestController {

  private TrafficLightService trafficLightService;

  @Autowired
  public TrafficLightRestController(TrafficLightService trafficLightService) {
    this.trafficLightService = trafficLightService;
  }

  @RequestMapping("/rest/traffic-lights")
  public List<TrafficLightStatusEntity> getTrafficLights() {
    return trafficLightService.getTrafficLights();
  }

}

package com.droy.trafficlights.service;

import com.droy.trafficlights.entity.TrafficLightStatusEntity;
import com.droy.trafficlights.enumeration.TrafficLight;
import com.droy.trafficlights.repository.TrafficLightStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrafficLightService {

    private TrafficLightStatusRepository trafficLightStatusRepository;

    @Autowired
    public TrafficLightService(TrafficLightStatusRepository trafficLightStatusRepository) {
        this.trafficLightStatusRepository = trafficLightStatusRepository;
    }

    public List<TrafficLightStatusEntity> getTrafficLights() {
        return trafficLightStatusRepository.getAllByIdGreaterThan(0);
    }

    public TrafficLightStatusEntity getTrafficLight(int id) {
        return trafficLightStatusRepository.getById(id);
    }

    public void updatetrafficLight(int id,
                                   String user,
                                   TrafficLight trafficLight,
                                   String message
                                   ) {
        TrafficLightStatusEntity trafficLightStatusEntity = trafficLightStatusRepository.getById(id);
        trafficLightStatusEntity.setUser(user);
        trafficLightStatusEntity.setTrafficLight(trafficLight);
        trafficLightStatusEntity.setMessage(message);
        trafficLightStatusRepository.save(trafficLightStatusEntity);
    }

}

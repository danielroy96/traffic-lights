package com.droy.trafficlights.service;

import com.droy.trafficlights.entity.TrafficLightStatusEntity;
import com.droy.trafficlights.enumeration.TrafficLight;
import com.droy.trafficlights.enumeration.TrafficLightOrdering;
import com.droy.trafficlights.repository.TrafficLightStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TrafficLightService {

    private TrafficLightStatusRepository trafficLightStatusRepository;

    @Autowired
    public TrafficLightService(TrafficLightStatusRepository trafficLightStatusRepository) {
        this.trafficLightStatusRepository = trafficLightStatusRepository;
    }

    public List<TrafficLightStatusEntity> getTrafficLights(TrafficLightOrdering order) {
        if (order == TrafficLightOrdering.ALPHA) {
            return trafficLightStatusRepository.getAllByIdGreaterThanOrderByUser(0);
        }
        return trafficLightStatusRepository.getAllByIdGreaterThanOrderByLastUpdatedDesc(0);
    }

    public TrafficLightStatusEntity getTrafficLight(int id) {
        return trafficLightStatusRepository.getById(id);
    }

    public void updatetrafficLight(int id,
                                   String user,
                                   TrafficLight trafficLight,
                                   String message,
                                   boolean workingFromHome,
                                   boolean awayFromKeyboard
                                   ) {
        TrafficLightStatusEntity trafficLightStatusEntity = trafficLightStatusRepository.getById(id);
        trafficLightStatusEntity.setUser(user);
        trafficLightStatusEntity.setTrafficLight(trafficLight);
        trafficLightStatusEntity.setMessage(message);
        trafficLightStatusEntity.setWorkingFromHome(workingFromHome);
        trafficLightStatusEntity.setAwayFromKeyboard(awayFromKeyboard);
        trafficLightStatusEntity.setLastUpdated(new Date());
        trafficLightStatusRepository.save(trafficLightStatusEntity);
    }

    public void deleteTrafficLight(int id) {
        TrafficLightStatusEntity trafficLightStatusEntity = trafficLightStatusRepository.getById(id);
        trafficLightStatusRepository.delete(trafficLightStatusEntity);
    }

    public void createTrafficLight(String user,
                                   TrafficLight trafficLight,
                                   String message,
                                   boolean workingFromHome,
                                   boolean awayFromKeyboard) {
        TrafficLightStatusEntity trafficLightStatusEntity = new TrafficLightStatusEntity(
                user,
                trafficLight,
                message,
                workingFromHome,
                awayFromKeyboard,
                new Date()
        );
        trafficLightStatusRepository.save(trafficLightStatusEntity);
    }

}

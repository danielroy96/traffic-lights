package com.droy.trafficlights.repository;

import com.droy.trafficlights.entity.TrafficLightStatusEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrafficLightStatusRepository extends CrudRepository<TrafficLightStatusEntity, Long> {

    public List<TrafficLightStatusEntity> getAllByIdGreaterThanOrderByLastUpdatedDesc(int i);

    public TrafficLightStatusEntity getById(int i);

}

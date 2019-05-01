package com.droy.trafficlights.entity;

import com.droy.trafficlights.enumeration.TrafficLight;

import javax.persistence.*;

@Entity
@Table(name = "trafficlightstatus")
public class TrafficLightStatusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user")
    private String user;

    @Column(name = "trafficlight")
    @Enumerated(EnumType.STRING)
    private TrafficLight trafficLight;

    @Column(name = "message")
    private String message;

    public TrafficLightStatusEntity(String user, TrafficLight trafficLight, String message) {
        this.user = user;
        this.trafficLight = trafficLight;
        this.message = message;
    }

    public TrafficLightStatusEntity() {
    }

    public int getId() {
        return id;
    }

    public String getUser() {
        return user;
    }

    public TrafficLight getTrafficLight() {
        return trafficLight;
    }

    public String getMessage() {
        return message;
    }
}

package com.droy.trafficlights.entity;

import com.droy.trafficlights.enumeration.TrafficLight;

import javax.persistence.*;
import java.util.Date;

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

    @Column(name = "workingfromhome")
    private boolean workingFromHome;

    @Column(name = "awayfromkeyboard")
    private boolean awayFromKeyboard;

    @Column(name = "lastupdated")
    private Date lastUpdated;

    public TrafficLightStatusEntity(String user,
                                    TrafficLight trafficLight,
                                    String message,
                                    boolean workingFromHome,
                                    boolean awayFromKeyboard,
                                    Date lastUpdated) {
        this.user = user;
        this.trafficLight = trafficLight;
        this.message = message;
        this.workingFromHome = workingFromHome;
        this.awayFromKeyboard = awayFromKeyboard;
        this.lastUpdated = lastUpdated;
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

    public boolean isWorkingFromHome() {
        return workingFromHome;
    }

    public boolean isAwayFromKeyboard() { return awayFromKeyboard; }

    public void setId(int id) {
        this.id = id;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setTrafficLight(TrafficLight trafficLight) {
        this.trafficLight = trafficLight;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setWorkingFromHome(boolean workingFromHome) {
        this.workingFromHome = workingFromHome;
    }

    public void setAwayFromKeyboard(boolean awayFromKeyboard) { this.awayFromKeyboard = awayFromKeyboard; }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}

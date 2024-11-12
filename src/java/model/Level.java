/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class Level {
    private int level_id;
    private String level_name;

    public Level() {
    }

    public Level(int level_id, String level_name) {
        this.level_id = level_id;
        this.level_name = level_name;
    }

    public int getLevel_id() {
        return level_id;
    }

    public void setLevel_id(int level_id) {
        this.level_id = level_id;
    }

    public String getLevel_name() {
        return level_name;
    }

    public void setLevel_name(String level_name) {
        this.level_name = level_name;
    }

    @Override
    public String toString() {
        return "Level{" + "level_id=" + level_id + ", level_name=" + level_name + '}';
    }
    
    
}

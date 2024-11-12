/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class Slider {

    private int slider_id;
    private String slider_image;
    private String slider_link;
    private String slider_detail;
    private String slider_title;

    public Slider() {
    }

    public Slider(int slider_id, String slider_image, String slider_link, String slider_detail, String slider_title) {
        this.slider_id = slider_id;
        this.slider_image = slider_image;
        this.slider_link = slider_link;
        this.slider_detail = slider_detail;
        this.slider_title = slider_title;
    }

    public int getSlider_id() {
        return slider_id;
    }

    public void setSlider_id(int slider_id) {
        this.slider_id = slider_id;
    }

    public String getSlider_image() {
        return slider_image;
    }

    public void setSlider_image(String slider_image) {
        this.slider_image = slider_image;
    }

    public String getSlider_link() {
        return slider_link;
    }

    public void setSlider_link(String slider_link) {
        this.slider_link = slider_link;
    }

    public String getSlider_detail() {
        return slider_detail;
    }

    public void setSlider_detail(String slider_detail) {
        this.slider_detail = slider_detail;
    }

    public String getSlider_title() {
        return slider_title;
    }

    public void setSlider_title(String slider_title) {
        this.slider_title = slider_title;
    }

}

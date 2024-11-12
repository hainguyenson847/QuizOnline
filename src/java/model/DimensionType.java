/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class DimensionType {
    private int dimension_type_id;
    private String dimension_type_name;

    public DimensionType() {
    }

    public DimensionType(int dimension_type_id, String dimension_type_name) {
        this.dimension_type_id = dimension_type_id;
        this.dimension_type_name = dimension_type_name;
    }

    public int getDimension_type_id() {
        return dimension_type_id;
    }

    public void setDimension_type_id(int dimension_type_id) {
        this.dimension_type_id = dimension_type_id;
    }

    public String getDimension_type_name() {
        return dimension_type_name;
    }

    public void setDimension_type_name(String dimension_type_name) {
        this.dimension_type_name = dimension_type_name;
    }

   
    
}

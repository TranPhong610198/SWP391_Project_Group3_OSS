/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author VuxD4t
 */
public class Footer {
    private int id;
    private String type;        // social, contact, info
    private String fieldName;
    private String value;
    private String status;

    public Footer() {
    }

    public Footer(int id, String type, String fieldName, String value, String status) {
        this.id = id;
        this.type = type;
        this.fieldName = fieldName;
        this.value = value;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Footer{" + "id=" + id + ", type=" + type + ", fieldName=" + fieldName + ", value=" + value + ", status=" + status + '}';
    }

    

}

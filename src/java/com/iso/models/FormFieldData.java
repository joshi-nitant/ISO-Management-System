/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.admin.models;

/**
 *
 * @author Nitant
 */
public class FormFieldData {
    private int form_field_dataid;
    private String field_1;
    private String field_2;

    public FormFieldData() {
    }

    public FormFieldData(int form_field_id, String field_1, String field_2) {
        this.form_field_dataid = form_field_id;
        this.field_1 = field_1;
        this.field_2 = field_2;
    }

    public int getForm_field_id() {
        return form_field_dataid;
    }

    public void setForm_field_id(int form_field_id) {
        this.form_field_dataid = form_field_id;
    }

    public String getField_1() {
        return field_1;
    }

    public void setField_1(String field_1) {
        this.field_1 = field_1;
    }

    public String getField_2() {
        return field_2;
    }

    public void setField_2(String field_2) {
        this.field_2 = field_2;
    }

    @Override
    public String toString() {
        return "FormFieldData{" + "form_field_id=" + form_field_dataid + ", field_1=" + field_1 + ", field_2=" + field_2 + '}';
    }
  
    
}

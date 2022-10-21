import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Kenny
 */
public class Square {

    protected double height;
    protected double width;
    protected double surfaceArea;
    //introduced needed fields

    public Square() {
    }

    public Square(double height1) {//1 arg constructor
        height = height1;
        width = height1;
        computeSurfaceArea();//runs method to set surface area                
    }

    public double getHeight() {
        return height;
    }

    public double getWidth() {
        return width;
    }

    public void setHeight(double height1) {
        height = height1;
    }

    public void setWidth(double width1) {
        width = width1;
    }

    public void computeSurfaceArea() {
        surfaceArea = width * height;     //calculates surfaceArea  
    }


    public double getSurfaceArea() {
        return surfaceArea;
    }

    public void print() {//prints results
        JOptionPane.showMessageDialog(null, "Square height: " + height + "\nSquare width :" + width + "\nSurface Area: " + surfaceArea);
    }
    

}
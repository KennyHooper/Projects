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
public class Cube extends Square {

    private double depth;

    public Cube() {
        super();//imports square class constructors
    }

    public Cube(double height1) {//1 arg constructor
        super(height1);//sets first 2 fields with square class 2 arg constructor
        depth = height1;
        computeSurfaceArea();//calculates Surface Area
    }

    public double getDepth() {
        return depth;
    }

    public void setDepth(double depth1) {
        depth = depth1;
    }

    public void computeSurfaceArea() {
        surfaceArea = 6.0 * height * height;
    }

    public double volume() {
        return height * height * height;

    }

    public double getSurfaceArea() {

        return surfaceArea;
    }

    public void print() {//shows results
        JOptionPane.showMessageDialog(null, "Cube height: " + height + "\nCube width :" + width + "\nDepth: " + depth 
                + "\nSurface Area: " + surfaceArea + "\nVolume: " + volume());
    }

}

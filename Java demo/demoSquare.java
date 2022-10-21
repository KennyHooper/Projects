/*Programmer: Kenny Hooper
Version: 1.0
Description: Program takes dimensions of a square and returns the surface area. 
Also takes dimensions of a cube and returns surface area and volume.
 */
public class DemoSquare {
    
    public static void main(String[] args){
    Square x = new Square(3);//sets dimensions of a square called x
    x.print();
    
    Cube y = new Cube(4);//sets dimensions of a cube called y
    y.print();
    }
    
    
}
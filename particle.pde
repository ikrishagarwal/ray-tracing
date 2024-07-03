class Particle {
  public PVector pos;
  
  Particle() {
    pos = new PVector(width/2, height/2);
  }
  
  public void update(float x, float y) {
    pos.set(x, y);
  }
  
  public void show() {
    fill(255);
    circle(pos.x, pos.y, 4);
  }
  
  public void look(ArrayList<Boundary> walls) {
    //
  }
}

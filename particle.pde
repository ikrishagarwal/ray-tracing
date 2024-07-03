class Particle {
  public PVector pos;
  public ArrayList<Ray> rays = new ArrayList<Ray>();

  Particle() {
    pos = new PVector(width/2, height/2);

    for (int i = 0; i < 360; i++) {
      rays.add(new Ray(pos, radians(i)));
    }
  }

  public void update(float x, float y) {
    pos.set(x, y);
  }

  public void show() {
    fill(255);
    circle(pos.x, pos.y, 4);

    for (Ray r : rays) {
      r.show();
    }
  }

  public void look(ArrayList<Boundary> walls) {
    for (Ray r : rays) {
      PVector closest = new PVector(-1.0, -1.0);
      float record = Float.POSITIVE_INFINITY;

      for (Boundary wall : walls) {
        PVector pt = r.cast(wall);

        if (pt.x != -1.0 && pt.y != -1.0) {
          float d = pos.dist(pt);

          if (d < record) {
            record = d;
            closest = pt;
          }
        }
      }

      if (closest.x != -1.0 && closest.y != -1.0) {
        stroke(255, 100);
        line(pos.x, pos.y, closest.x, closest.y);
      }
    }
  }
}

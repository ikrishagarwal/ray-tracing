ArrayList<Boundary> walls = new ArrayList<Boundary>();
Particle particle;

float xoff = 0;
float yoff = 100000;

int x = 0;

void setup() {
  size(1600, 720);

  // adding 5 random walls all over the canvas
  for (int i = 0; i < 5; i++) {
    float x1 = random(width);
    float y1 = random(height);
    float x2 = random(width);
    float y2 = random(height);

    walls.add(new Boundary(x1, y1, x2, y2));
  }

  // making the edges of the canvas
  walls.add(new Boundary(0, -0.5, width, -0.5));
  walls.add(new Boundary(width, 0, width, height));
  walls.add(new Boundary(width, height, 0, height));
  walls.add(new Boundary(-0.5, height, -0.5, 0));
  
  particle = new Particle();
}

void draw() {
  background(0);

  for (Boundary wall : walls)
    wall.show();

  particle.update(noise(xoff) * width, noise(yoff) * height);
  particle.show();
  particle.look(walls);

  xoff += 0.005;
  yoff += 0.005;
}

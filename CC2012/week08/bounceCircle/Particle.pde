class Particle {
  PVector loc, vel;
  
  Particle() {
    loc = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    loc.limit(radius-50);
    randomDirection();
  }
  
  void update() {
    loc.add(vel);
    if (loc.dist(origin) > radius) {
      PVector n = loc.get();
      n.normalize();
      n.mult(2*n.dot(vel));
      vel.sub(n);
    }
  }
  
  void display() {
    fill(frameCount % 360, 100, 100);
    float eSize = 12 + sin(frameCount * 0.05) * 6;
    ellipse(loc.x, loc.y, eSize, eSize);
  }
  
  void randomDirection() {
    vel = new PVector(random(-1, 1), random(-1,1));
    vel.normalize();
    vel.mult(3);
  }
}


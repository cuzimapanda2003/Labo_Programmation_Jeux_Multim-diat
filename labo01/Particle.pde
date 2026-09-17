class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  boolean affected = false; 

  Particle() {
    position = new PVector(width/2, height/3);
    initialize();
  }

  Particle(PVector l) {
    position = l.copy();
    initialize();
  }

  void initialize() {
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0.09);
    lifespan = 255;
  }
  
  void applyForce(PVector force) {  
    acceleration.add(force);
  }

  void update(int delta) {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0, 0.09); 
    lifespan -= 2.0;

    if(isDead()) {
      reset();
    }
  }

  void display() {
     noStroke();
    if (!affected) {
      fill(0, 0, 255, lifespan);
    } else {
      fill(120, 0, 120, lifespan);
    }
    ellipse(position.x, position.y, 10, 10);
  }

  boolean isDead() {
    return lifespan < 0.0;
  }

  void reset() {
    position.set (width/2,  height/3);
    velocity.set (random(-1, 1), random(-2, 0));    
    lifespan = 255;
  }
}

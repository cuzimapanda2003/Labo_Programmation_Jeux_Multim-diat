class Player {
  PVector position;
  float radius = 15;
  float speed = 0.3;
  
  float attractDistance = 100;  
  float releaseDistance = 200;  
  float strength = 4;          

  Player() {
    position = new PVector(width / 2, height - 30);
  }

  void setDistance(float activation, float desactivation) { 
    attractDistance = activation;
    releaseDistance = desactivation;
  }

  void update(int deltaTime) {
    if (keyPressed) {
      if (key == 'a' || key == 'A') position.x -= speed * deltaTime;
      if (key == 'd' || key == 'D') position.x += speed * deltaTime;
      if (key == 'w' || key == 'W') position.y -= speed * deltaTime;
      if (key == 's' || key == 'S') position.y += speed * deltaTime;
    }
    position.x = constrain(position.x, radius, width - radius);
  }
  
    PVector attract(Particle p) {
    PVector dir = PVector.sub(position, p.position);
    float d = dir.mag();

    if (p.affected) {
      if (d > releaseDistance) return null;
    } else {
      if (d > attractDistance) return null;
    }

    dir.normalize();
    dir.mult(strength);
    return dir;
  }

  void display() {
    fill(200, 0, 0);
    noStroke();
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}

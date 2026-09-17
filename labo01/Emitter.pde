class Emitter {
  PVector position;
  int particleRate;
  int lastParticleTime;
  int maxParticles = 20000;
  ArrayList<Particle> particles;

  Emitter(PVector l, int rate) {
    position = l.copy();
    particleRate = rate;
    lastParticleTime = 0;
    particles = new ArrayList<Particle>();

  }

  void update(int deltaTime) {   
    if (millis() - lastParticleTime > particleRate && particles.size() < maxParticles) {
      lastParticleTime = millis();
      for (int i = 0; i <= 50; i++) {
        particles.add(new Particle(position));
      }
    }

    for (Particle p : particles) {
      PVector force = player.attract(p); 
      if (force != null) {
        p.applyForce(force);
        p.affected = true;
      } else {
        p.affected = false;
      }
      p.update(deltaTime);
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
}

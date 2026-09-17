int currentTime;
int deltaTime;
int previousTime;

Emitter emitter;
Player player;

void setup() {
  size(800, 600);
  emitter = new Emitter(new PVector(width / 2, height / 4), 10);
  player = new Player();
  player.setDistance(200, 300); 

}

void draw() {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;

  update(deltaTime);
  display();
}

void update(int deltaTime) {
  player.update(deltaTime); 
  emitter.update(deltaTime); 
}

void display() {
  background(255);
  player.display();
  emitter.display();
}

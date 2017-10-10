private Grid grid;

void throwChunk() {
  int x = (int) random(width - 100);
  int y = (int) random(height - 100);
  
  for (int i = 0; i < 100; i += 3) {
    for (int j = 0; j < 100; j += 3) {
       grid.throwParticles(x + i, y + j); 
    }
  }
}

void setup()
{
  //noiseSeed((long)random(500));
  size(1280, 720, P2D);
  frameRate(60);
  grid = new Grid();
  throwChunk();
}

void draw() {
  background(0, 0, 0);
  grid.updateVectors();
  grid.draw();   
  
  if (mousePressed)
    throwChunk();   

  //saveFrame("frames/####.png");
} 
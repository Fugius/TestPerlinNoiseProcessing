class Particle {
  
  private PVector pos;
  private PVector speed;
  private PVector acc;
  private float maxSpeed;
  
  private color c;
  
  public Particle(float x, float y) {
    pos = new PVector(x ,y);
    speed = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    maxSpeed = 0.5;
    
    c = color(255, 255, 255);
  }
  
  public void setColor(int r, int g, int b) {
    c = color(r, g, b);
  }
  
  public void update(PVector[][] field, float cellSize) {
    //<>//
    if (pos.x <= 0)
      pos.x = cellSize * (field.length - 1);
      
    if (pos.x >= width)
      pos.x = 0;
      
    if (pos.y <= 0)
      pos.y = cellSize * (field[0].length - 1);
      
    if (pos.y >= height)
      pos.y = 0;
       
       
    
    int indexX = floor(pos.x / cellSize);
    int indexY = floor(pos.y / cellSize);
    
    acc.add(field[indexX][indexY]);
    
    speed.add(acc);
    pos.add(speed);
    speed.limit(maxSpeed);
    
    
    acc.mult(0);

  }
  
  public void draw() {
    if (pos.x > 0 && pos.y > 0) {
      stroke(c);
      point(pos.x, pos.y);
    }
  }
}
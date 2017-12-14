public int PPDC(int a, int b) {
   ArrayList<Integer> aDivs = new ArrayList<Integer>();
   ArrayList<Integer> bDivs = new ArrayList<Integer>();
   ArrayList<Integer> sameDivs = new ArrayList<Integer>();
    
   for (int i = 2; i < a; i++) {
     if (a%i == 0) {
       aDivs.add(i); 
     }
   }
   
  for (int i = 2; i < b; i++) {
     if (b%i == 0) {
       bDivs.add(i); 
     }
   }
   
   for (int i = 0 ; i < aDivs.size(); i++) {
     for (int j = 0; j < bDivs.size(); j++) {
        if (aDivs.get(i) == bDivs.get(j)) {
          sameDivs.add(aDivs.get(i));
        }
     }
   }
  
  if (sameDivs.size() >= 8)
    return sameDivs.get(1);
  else
    return sameDivs.get(0);

}

class Grid {
  private float cellSize;
  private PVector gridSize;
  private PVector[][] directions;
  
  private float xoff, yoff, zoff;
  private float sc;
  
  private ArrayList<Particle> particles;
  
  public Grid() {
    cellSize = PPDC(width, height);
    
    gridSize = new PVector(width/cellSize, height/cellSize);
    directions = new PVector[(int)gridSize.x][(int)gridSize.y];
    
    particles = new ArrayList<Particle>();
    
    xoff = 0;
    yoff = 0;
    zoff = 10;
    
    sc = PI/18;
    
  }
  
  public void updateVectors() {
    
    xoff = 0;
    yoff = 0;
    
    for (int i = 0; i < gridSize.x; i++) {
      for (int j = 0; j < gridSize.y; j++) {
        directions[i][j] = PVector.fromAngle(noise(xoff, yoff, zoff) * TWO_PI);
        yoff += sc;
        //zoff += 0.001;
      }
      yoff = 0;
      xoff += sc;
    }
    
    zoff += 0.007;
    
  }
  
  public void throwParticles(float x, float y) {
    particles.add(new Particle(x, y));
  }
  
  public void draw() {
    if (frameRate < 20)
      particles.clear();
    
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).update(directions, cellSize);
    }
    
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).draw();
    }
    
  }
  
  
}
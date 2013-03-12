class Player {

  float playerSize;
  float playerSpeed;
  PVector pos;
  int health;
  boolean alive;

  void prime() {
    playerSpeed = 5;
    playerSize = 20;
    pos = new PVector(20, 20);
    health = 100;
    alive = true;
  }

  void drawPlayer() {
    fill(0, 175, 0);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void update() {

    //collision detection: Player against sheep
    for (int i=0;i<sheep.length;i++) {   
      if (pos.dist(sheep[i].pos) < (peopleSize)) {
        sheep[i].sheepVel.x *= -1; 
        sheep[i].sheepVel.y *= -1;
        health-=2;
        println(health);
      }
    }
    //sheep against sheep
    for (int i=0;i<sheep.length;i++) {
      for (int j=0;j<sheep.length;j++) {   

        if (sheep[i].pos.dist(sheep[j].pos) < (peopleSize) && sheep[i] != sheep[j]) {
          //          sheep[i].sheepVel.x *= -1; 
          //          sheep[i].sheepVel.y *= -1;
        }
      }
    }


    if (upTrue==true) {
      pos.y -= playerSpeed;
    }

    if (downTrue==true) {
      pos.y += playerSpeed;
    }

    if (leftTrue==true) {
      pos.x -= playerSpeed;
    }

    if (rightTrue==true) {
      pos.x += playerSpeed;
    }
  }
}


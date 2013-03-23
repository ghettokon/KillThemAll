class Target {

  float lerp=-.01;
  PVector pos;
  PVector targetVel;
  color targetColor;

  void prime() {
    targetColor = color(175, 175, 0);
    targetVel= new PVector(random(-2, 2), random(-2, 2));
    peopleSize = 20;
    pos = new PVector(random(peopleSize/2, width-peopleSize/2), random(peopleSize/2+spawnBuffer, height-peopleSize/2));
  }

  void drawTarget() {
    fill(targetColor);
    stroke(0);
    ellipse(pos.x, pos.y, peopleSize, peopleSize);
  }

  void update() {

    if (timeFreeze==true) {
      pos.x+=0;
      pos.y+=0;
    }
    else {
      if (pos.dist(player.pos) < 200 && pos.x >10+spawnBuffer && pos.x<width-10 && pos.y>10 && pos.y<height-10) {        
            pos.lerp(player.pos, lerp);
      }

      pos.add(targetVel);
      lerp=-.01;
    }

    if (pos.x<=peopleSize/2 || pos.x>=width-peopleSize/2) {
      //  lerp=0;
      targetVel.x*=-1;
    }

    if (pos.y<=peopleSize/2 + spawnBuffer || pos.y >= height-peopleSize/2) {
      // lerp=0;
      targetVel.y*=-1;
    }

    if (found==true) {
      targetColor = color(175, 0, 0);
    }
    else if(found==false){
      targetColor = color(175, 175, 0);
    }
  }
}


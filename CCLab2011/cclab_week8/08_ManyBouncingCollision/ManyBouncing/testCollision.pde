/*
Using math from http://processing.org/learning/topics/circlecollision.html
 */

void testCollision(Ball firstBall, Ball secondBall) {

  // get distances between the two objects
  PVector testVector = new PVector();
  testVector.x = firstBall.x - secondBall.x;
  testVector.y = firstBall.y - secondBall.y;

  // calculate the distance magnitude between the two objects
  float testVectorDist = sqrt(testVector.x * testVector.x + testVector.y * testVector.y);

  if (testVectorDist < firstBall.r + secondBall.r) {
    // get angle of bVect
    float theta  = atan2(testVector.y, testVector.x);
    // precalculate trig values
    float sine = sin(theta);
    float cosine = cos(theta);


    firstBall.tempVal.x  = cosine * testVector.x + sine * testVector.y;
    firstBall.tempVal.y  = cosine * testVector.y - sine * testVector.x;

    secondBall.tempVal.x  = cosine * testVector.x + sine * testVector.y;
    secondBall.tempVal.y  = cosine * testVector.y - sine * testVector.x;

    // rotate Temporary velocities
    PVector[] vTemp = { 
      new PVector(), new PVector()
    };
    vTemp[0].x  = cosine * firstBall.vels.x + sine * firstBall.vels.y;
    vTemp[0].y  = cosine * firstBall.vels.y - sine * firstBall.vels.x;
    vTemp[1].x  = cosine * secondBall.vels.x + sine * secondBall.vels.y;
    vTemp[1].y  = cosine * secondBall.vels.y - sine * secondBall.vels.x;

    /* Now that velocities are rotated, you can use 1D
     conservation of momentum equations to calculate 
     the final velocity along the x-axis. */

    // final rotated velocity for b[0]
    firstBall.finalVal.x = ((firstBall.m - secondBall.m) * vTemp[0].x + 2 * secondBall.m * 
      vTemp[1].x) / (firstBall.m + secondBall.m);
    firstBall.finalVal.y = vTemp[0].y;
    // final rotated velocity for b[0]
    secondBall.finalVal.x = ((secondBall.m - firstBall.m) * vTemp[1].x + 2 * firstBall.m * 
      vTemp[0].x) / (firstBall.m + secondBall.m);
    secondBall.finalVal.y = vTemp[1].y;

    // hack to avoid clumping
    firstBall.tempVal.x += firstBall.finalVal.x;
    secondBall.tempVal.x += secondBall.finalVal.x;

    /* Rotate ball positions and velocities back
     Reverse signs in trig expressions to rotate 
     in the opposite direction */
    // rotate balls
    Ball[] bFinal = new Ball[2];

    bFinal[0].x = cosine * firstBall.tempVal.x - sine * firstBall.tempVal.y;
    bFinal[0].y = cosine * firstBall.tempVal.y + sine * firstBall.tempVal.x;
    bFinal[1].x = cosine * secondBall.tempVal.x - sine * secondBall.tempVal.y;
    bFinal[1].y = cosine * secondBall.tempVal.y + sine * secondBall.tempVal.x;

    // update balls to screen position
    secondBall.x = firstBall.x + bFinal[1].x;
    secondBall.y = firstBall.y + bFinal[1].y;
    firstBall.x = firstBall.x + bFinal[0].x;
    firstBall.y = firstBall.y + bFinal[0].y;

    // update velocities
    firstBall.vels.x = cosine * firstBall.finalVal.x - sine * firstBall.finalVal.y;
    firstBall.vels.y = cosine * firstBall.finalVal.y + sine * firstBall.finalVal.x;
    secondBall.vels.x = cosine * secondBall.finalVal.x - sine * secondBall.finalVal.y;
    secondBall.vels.y = cosine * secondBall.finalVal.y + sine * secondBall.finalVal.x;
  }
}

/*
void testCollision(Ball firstBall, Ball secondBall) {
 
 float dx = firstBall.x - secondBall.x;
 float dy = firstBall.y - secondBall.y;
 float distance = (sqrt((dx*dx)+(dy*dy)));
 
 float minDist = firstBall.w/2 + secondBall.w/2;
 
 if (distance < minDist) {
 if (firstBall.x < secondBall.x)
 firstBall.xSpeed = -firstBall.xSpeed;
 firstBall.ySpeed = -firstBall.ySpeed;
 secondBall.xSpeed = -secondBall.xSpeed;
 secondBall.ySpeed = -secondBall.ySpeed;
 }
 
 if (distance<(minDist*5)) {
 stroke(firstBall.c);
 strokeWeight(0.5);
 line(firstBall.x, firstBall.y, secondBall.x, secondBall.y);
 }
 }
 */

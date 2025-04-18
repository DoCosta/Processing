float lensRadius = 50;  // Initial lens radius

void setup() {
  size(800, 600);
  // No image loaded: using a red background
}

void draw() {
  // Draw a solid red background
  background(255, 0, 0);
  
  // Draw the magic lens effect at the current mouse position
  drawMagicLens(mouseX, mouseY, lensRadius);
  
  // Optionally, draw the outline of the lens (uncomment below)
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, lensRadius*2, lensRadius*2);
}

void drawMagicLens(float centerX, float centerY, float r) {
  // Iterate over a grid of points in the lens area (using a step size to simulate pixels)
  for (float i = centerX - r; i < centerX + r; i += 5) {
    for (float j = centerY - r; j < centerY + r; j += 5) {
      // Check if the point (i,j) is inside the circular lens area
      if (dist(centerX, centerY, i, j) < r) {
        // With a probability of 10%, draw a "magical" effect at that point
        if (random(1) < 1) {
          float circleSize = 5 + random(-5, 5);  // Randomized size for fluctuation
          fill(0, 0, 0); // Yellow color for the magical effect
          noStroke();
          ellipse(i, j, circleSize, circleSize);
        }
      }
    }
  }
}

// Allow the lens size to be adjusted using the mouse wheel
void mouseWheel(MouseEvent event) {
  lensRadius += event.getCount() * 5;
  // Prevent the lens from getting too small
  lensRadius = max(10, lensRadius);
}

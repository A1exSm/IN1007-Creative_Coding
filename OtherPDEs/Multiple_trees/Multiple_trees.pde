float xpos;
void setup()
{
  size(900, 400);
  noStroke();
}

void draw()
{
  background(157, 238, 247);   // Sky
  fill(156, 245, 170);         // Ground.
  rect(0, height/2, width, height);
  // Local variables
  float add = 0;
  float count = 3;
  float alpha = 10;
  float tree_gap = 30;
  // Loops to create Trees
  for (float row=190; row<height-60; row+=40) {
    add +=20;
    for (float xPos=-20; xPos<width; xPos=xPos+tree_gap) {
      drawTree((xPos+add), row, count, alpha);
    }
    tree_gap += 30;
    count -= 1.6;
    if (count < 1) count = 1;
    alpha += 12;
    if (alpha > 255) alpha = 255;
  }
}

void drawTree(float treeX, float treeY, float count, float alpha) {
  color leafColour = color(98-alpha, 172-alpha,116-alpha);
  color trunkColour = color(95, 57, 26);
  fill(trunkColour);
  float treeW = 20;
  float treeH = 70;
  rect(treeX, treeY, treeW/count, treeH/count);
  fill(leafColour);
  ellipse(treeX+((treeW/count)/2), treeY-(30/count), 70/count, 90/count);
}

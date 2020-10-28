void sphere2(float r) {

  stroke(200);
  strokeWeight(0.5);

  

  for (int i=0; i<total+1; i++) {

    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, iteration, latitude1, latitude2, longitude2);

    for (int j=0; j<total+1; j++) {

      float lon = map(j, 0, total, -PI, 0);
      float r1 = supershape(lon, iteration, longitude1, 1.7, 1.7);
      float x = r * r1 * cos(lon) * r2 * cos(lat);
      float y = r * r1 * sin(lon) * r2 * cos(lat);
      float z = r * r2 * sin(lat);
      globe[i][j] = new PVector (x, y, z);
    }
  }
  for (int i=0; i<total; i++) {
    if (i % 2 ==0) {
      fill(255);
    } else {
      fill(255);
    }
    beginShape(QUAD_STRIP);
    for (int j=0; j<total+1; j++) {

      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape(CLOSE);
  }
}

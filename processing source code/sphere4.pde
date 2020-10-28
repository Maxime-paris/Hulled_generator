PVector[][] globe3;
public int total3 = 100;  // non modifiable car doit respecter l'array
float a3 = 1;
float b3 = 1;

void sphere4() {

  stroke(200);
  strokeWeight(0.5);

  float r = 500;
  for (int i=0; i<total+1; i++) {

    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, longitude2*10, longitude1, latitude2, longitude1);

    for (int j=0; j<total+1; j++) {

      float lon = map(j, 0, total, -PI, PI);
      float r1 = supershape(lon, iteration*iteration, iteration, 0-5*latitude1, longitude1);
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

float supershape3 (float theta, float m, float n1, float n2, float n3) {

  float t1 = abs(( 1 / a ) * cos( m * theta / 4 ));
  t1 = pow(t1, n2);
  float t2 = abs(( 1 / b ) * sin( m * theta / 4 ));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);

  return r;
}

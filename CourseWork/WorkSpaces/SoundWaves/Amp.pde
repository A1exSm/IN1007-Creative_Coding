void checkBool(Wave wave) {
  // check wave amplitude
  if (wave.amp > (height/2)-1) {
    wave.largeA = true;
    wave.smallA = false;
  } else if (wave.amp < 1) {
    wave.largeA = false;
    wave.smallA = true;
  }
  // check wave length
  if (wave.wlength > width/wave.cycles) {
    wave.largeW = true;
    wave.smallW = false;
  } else if (wave.wlength < 1) {
    wave.largeW = false;
    wave.smallW = true;
  }
}

// max wave length = width / numCycles

void incrementAmp(Wave wave) {
  // updates wave amplitude
  if (wave.largeA) {
    wave.amp -= wave.speed*10;
  } else if (wave.smallA) {
    wave.amp += wave.speed*10;
  }
  // updates wave length
    if (wave.largeW) {
    wave.wlength -= wave.speed;
  } else if (wave.smallW) {
    wave.wlength += wave.speed;
  }
}

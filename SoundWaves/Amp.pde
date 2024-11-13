void checkBool(int index) {
  if (amplitude[index] > 199) {
    large[index] = true;
    small[index] = false;
  } else if (amplitude[index] < 1) {
    large[index] = false;
    small[index] = true;
  }
}

void incrementAmp(int index) {
  if (large[index]) {
    amplitude[index]--;
  } else if (small[index]) {
    amplitude[index]++;
  }
}

#include <Adafruit_NeoPixel.h>

#define PIN 5
#define NUMPIXELS 19

Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
#define DELAYVAL 0 

const int buttonPin = 3;
int buttonState = 0; 
int red_light_value = 0;
int green_light_value = 10;
int blue_light_value = 0;

void setup() {
  pixels.begin();
  pixels.show();
  Serial.begin(115200); 
}

int currP = 0;
boolean changed = true;

void loop() {
  float value = 0.0;
  if(Serial.available()){
    value = Serial.parseFloat();
    RGB_color(value);
  }
  
  for(int i=13; i<NUMPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(red_light_value,green_light_value,blue_light_value));
    int tail = i - 3;
    if (tail < 13) tail = 19 - (13-tail);
    pixels.setPixelColor(tail, 0);
    pixels.setPixelColor(12, pixels.Color(red_light_value,green_light_value,blue_light_value));
    buttonStuffs();
    pixels.show();
    delay(DELAYVAL); 
  }
   
}

void buttonStuffs() {
  buttonState = digitalRead(buttonPin);
  
  if (buttonState == LOW and changed == false) {
    // turn LED on: 
    pixels.setPixelColor(currP, 0);
    currP++;
    if (currP == 12) { 
      currP = 0;
    }
    pixels.setPixelColor(currP, pixels.Color(0,0,20));
    pixels.show();
    changed = true;
  }

  else if (buttonState == HIGH) {
    changed = false;
  }
}

void RGB_color(float value)
 {
  blue_light_value = 0;
  if (value < 0.5) {
    red_light_value = 255;
    green_light_value = (int) 255*2*value; 
  }
  else {
    red_light_value = (int) 255 - 255*(value-0.5)*2;
    green_light_value = 255; 
  }
}

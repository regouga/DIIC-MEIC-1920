#include <Adafruit_NeoPixel.h>

#define LEDS_PIN 2
#define BUTTON_PIN 5
#define NUMPIXELS 19

Adafruit_NeoPixel pixels(NUMPIXELS, LEDS_PIN, NEO_GRB + NEO_KHZ800);

int buttonState = 0; 
uint32_t curr_color[5];
int curr_selection = -1;
boolean update_leds = true;

void setup() {
  pixels.begin();
  pixels.show();
  for(int i=0; i<5; i++) {
    curr_color[i] = pixels.Color(0,0,0);
  }
  Serial.begin(115200); 
  pinMode(BUTTON_PIN, INPUT_PULLUP);
}

void loop() {
  int value = 0;
  
  if(Serial.available()){
    Serial.println("New values received");
    for(int i=0; i<5; i++) {
      int value = Serial.read();
      Serial.print("Value: ");
      Serial.println(value / 100.0); 
      curr_color[i] = toColor(value / 100.0);
    }
    update_leds = true;
  };
  
  if (digitalRead(BUTTON_PIN) == LOW) {
    update_leds = true;
    delay(200);
    buttonStuffs();
    Serial.println("Button pressed");
  }

  if (update_leds) {
    Serial.println("Updating LEDs");
    for(int i=12; i<NUMPIXELS; i++) pixels.setPixelColor(i, curr_color[curr_selection+1]);
    if (curr_selection == -2) {
      for(int i=12; i<NUMPIXELS; i++) pixels.setPixelColor(i, 0);
    }
    pixels.show();
    update_leds = false;
  }
}

void buttonStuffs() {
  int shift = 0;
  if(curr_selection >= 0) pixels.setPixelColor(curr_selection * 3 + shift, 0);
  curr_selection++;
  if (curr_selection == 4) { 
    curr_selection = -2;
  }
  if(curr_selection >= 0) pixels.setPixelColor(curr_selection * 3 + shift, pixels.Color(0,0,0.1*255));
}

uint32_t toColor(float value)
 {
  int red, green, blue;
  value = 1 - value;
  blue = 0;
  if (value < 0.5) {
    red = 255;
    green = (int) 255*2*value; 
  }
  else {
    red = (int) 255 - 255*(value-0.5)*2;
    green = 255; 
  }

  char stringos[50];
  sprintf(stringos, "Color: (%d, %d, %d)\n", red, green, blue);
  Serial.println(stringos);
  return pixels.Color(0.1*red,0.1*green,0.1*blue);
}

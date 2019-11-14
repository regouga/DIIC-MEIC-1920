/*
  For Loop Iteration

 Demonstrates the use of a for() loop.
 Lights multiple LEDs in sequence, then in reverse.

 The circuit:
 * LEDs from pins 3 through 7 to ground

 created 2006
 by David A. Mellis
 modified 30 Aug 2011
 by Tom Igoe

This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/ForLoop
 */


const int buttonPin = 2;     // the number of the pushbutton pin
// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

int red_light_pin= 11;
int green_light_pin = 10;
int blue_light_pin = 9;

int r = 255;
int g = 0;
int b = 0;

// quando e zero, red max
// 0 -0,5: aumentar gradualmente green
// 0,5 -1: diminuir vermelho 


void setup() {
  Serial.begin(9600);
  // use a for loop to initialize each pin as an output:
  for (int thisPin = 3; thisPin < 7; thisPin++) {
    pinMode(thisPin, OUTPUT);
  }
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);

  pinMode(red_light_pin, OUTPUT);
  pinMode(green_light_pin, OUTPUT);
  pinMode(blue_light_pin, OUTPUT);
}


// BOTAO CENAS STUFFS -------------


// ---------------

int thisPin = 3;
boolean changed = false;
void loop() {
  buttonState = digitalRead(buttonPin);

  // check if the pushbutton is pressed.
  // if it is, the buttonState is HIGH:
  digitalWrite(thisPin, LOW);
  
  if (buttonState == LOW and changed == false) {
    // turn LED on: 
    thisPin++;
    if (thisPin == 7) { 
      thisPin = 3;
    }
    changed = true;
  }

  else if (buttonState == HIGH) {
    changed = false;
  }

  
  digitalWrite(thisPin, HIGH);
  RGB_color(0.5);
  
}

void RGB_color(int value)
 {
  blue_light_value = 0;
  if (value < 0.5) {
    reg_light_value = 255;
    green_light_value = 255*2*value; 
  }
  else {
    reg_light_value = 255 - 255*(value-0.5)*2;
    green_light_value = 255; 
  }
  
  analogWrite(red_light_pin, red_light_value);
  analogWrite(green_light_pin, green_light_value);
  analogWrite(blue_light_pin, blue_light_value);
}

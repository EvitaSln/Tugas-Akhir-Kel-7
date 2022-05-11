#include <EEPROM.h>
#include "GravityTDS.h"
#include <ESP8266WiFi.h>
#define TdsSensorPin A0
GravityTDS gravityTds;
#include <NewPing.h> //Library untuk HC-SR04
#define TRIGGER_PIN  D3  //Pin Trigger HC-SR04 pada NodeMCU
#define ECHO_PIN     D5//Pin Echo HC-SR04 pada NodeMCU
#define RELAY_PIN D1
#define RELAY_PIN2 D0
#define MAX_DISTANCE 250 //Maksimum Pembacaan Jarak (cm)

#include <PubSubClient.h>

const char *ssid = "Hidroponik"; //ganti nama wifi   (wifi hotspot)
const char *password = "123456789";//ganti password
const char *ID = "Example_Switch";  //node Name of our device, must be unique
const char *TOPIC1 = "topic/distance";  // Topic to subcribe to
const char *TOPIC2 = "topic/ppm";  // Topic to subcribe to

   char tempString[8];
IPAddress broker(192,168,38,47); // IP address of your MQTT broker
WiFiClient wclient;

PubSubClient client(wclient); // Setup MQTT client
bool state=0;

// Connect to WiFi network
void setup_wifi() {
  Serial.print("\nConnecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password); // Connect to network

  while (WiFi.status() != WL_CONNECTED) { // Wait for connection
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

// Reconnect to client
void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect(ID)) {
      Serial.println("connected");
      Serial.print("Publishing to: ");
      Serial.println(TOPIC1);
      Serial.println(TOPIC2);
      Serial.println('\n');

    } else {
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

float temperature = 21,tdsValue = 0; //mendeklarasikan
long duration;
int distance;
int ppm;
long nutrisi;
float m1 = 1400;
float m2;
float m3;
float v1 = 10;

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); //Setup Pin HC-SR04 dan Jarak Pembacaan dengan Fungsi Library

void setup()
{
    Serial.begin(9600);
    
delay(10);

 setup_wifi(); // Connect to network
 client.setServer(broker, 1883); //menghubungkan ke broker dan network 1883
 

gravityTds.setPin(TdsSensorPin);  //ketetapan
    gravityTds.setAref(5.0);  //reference voltage on ADC, default 5.0V on Arduino UNO  (arus)
    gravityTds.setAdcRange(1024);  //1024 for 10bit ADC;4096 for 12bit ADC (bit range)
    gravityTds.begin();  //initialization 
    delay(10);

  pinMode(TRIGGER_PIN, OUTPUT);  // set nodemcu pin to output mode (punya ultrasonic)
  pinMode(ECHO_PIN, INPUT);   // set nodemcu pin to input mode (ultrasonic)
  pinMode(RELAY_PIN, OUTPUT); // set nodemcu pin to output mode 
  pinMode(RELAY_PIN2, OUTPUT); // set nodemcu pin to output mode
}

void loop()
{
  if (!client.connected())  // Reconnect if connection is lost
  {
    reconnect();
  }
  client.loop();

  
  digitalWrite(TRIGGER_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIGGER_PIN, LOW);
  
  digitalWrite(TRIGGER_PIN, LOW);
  delayMicroseconds(2);

  // measure duration of pulse from ECHO pin
  duration = pulseIn(ECHO_PIN, HIGH);
  // calculate the distance 
  distance = duration*0.034/2; //menghitung jarak

  // print the value to Serial Monitor
    char tempString[8]; //identifier(identitas)
    dtostrf(distance, 1, 2, tempString);
  Serial.print("distance: ");
      Serial.println(tempString);

      

  Serial.print("\n ");
  
  client.publish("topic/distance",tempString); //publish data distance ke mqtt
  
if (distance<=15)
{
digitalWrite(RELAY_PIN, HIGH);
delay(500);
} 
else if (distance >=20 && distance <= 30) //akan menyala jika antar 20 sampai 30
{ 
 digitalWrite(RELAY_PIN, LOW);// akan mati jika memenuhi
 delay (500);
}
else
{
digitalWrite(RELAY_PIN,LOW);
delay(500);

}

  
    //temperature = readTemperature();  //add your temperature sensor and read it
    gravityTds.setTemperature(temperature);  // set the temperature and execute temperature compensation
    gravityTds.update();  //sample and calculate
    tdsValue = gravityTds.getTdsValue();  // then get the value
    Serial.print(tdsValue,0)  ;
    char humString[8];
    dtostrf(tdsValue, 1, 2, humString);
 
    Serial.println("ppm");
      Serial.println(humString);

  Serial.print("\n ");
  
  client.publish("topic/ppm",humString);
  
  
    delay(1000);

    float V2;
    V2 = (10*(1050 - 2100)) / (2100 - tdsValue); 
    if (V2<=1050)
{
digitalWrite(RELAY_PIN2, LOW);
delay(500);
} 
else if (V2 >=1050 && V2 <= 1400)   //relay akan menyala pada batas antara 1110 sampai 1400
{
 digitalWrite(RELAY_PIN2, HIGH);
 delay (500);
}
else
{
digitalWrite(RELAY_PIN2,HIGH); //dan akan mati jika memenuhi
delay(500);

}
}

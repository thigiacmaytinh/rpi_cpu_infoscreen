# rpi_cpu_infoscreen
A small program to drive the pcd8544 cpu info screen on a raspberry pi

Chương trình hiển thị thông tin lên màn hình 1.6" gắn vào Raspberry Pi.

![Final product](59d4fe079d1e6c40350f.jpg)

## Introduction
This is a simple small program to drive a product called the RPi 1.6" CPUInfo Screen
This product basically contains a Nokia 5110 screen with a pcd8544 controller.


## The hardware

The pinout of this circuit is as follows

| Function |    PIN   | WiringPI |
|----------|----------|----------|
|CLK       |        11|         0|
|DIN       |        12|         1|
|DC        |        13|         2|
|CE        |        15|         3|
|Vcc       |         1|          |
|Gnd       |         6|          |
|Rst       |        16|         4|
|BackLgt   |         7|         7|


## Prerequisites
First install the wiringPi library if not already installed.
Instructions can be found here:

http://raspberry-python.blogspot.nl/2012/09/getting-wiringpi-on-pi.html

or here

http://wiringpi.com/download-and-install/

If not already installed install build-essential with
```
sudo apt-get update
sudo apt-get install build-essential
```
git clone this code
```
git clone https://github.com/MichelVos/rpi_cpu_infoscreen.git
```

## How to build

enter the directory where you installed this source
Enter the src directory and type
```
make
```
After a little while you should have a program called 

test_bcm8544

## How to use

Now you can enter
```
test_bcm8544 hello world
```
on the command line

There is also a little script called update that fetches some more or less usefull stuff to put on your shiny new display.

Enjoy!



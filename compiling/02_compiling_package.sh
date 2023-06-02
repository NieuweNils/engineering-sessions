#!/bin/bash

# Hello World in package com.eneco.teaching on Command Line
echo ">> javac src/main/java/com/eneco/project/HelloWorld.java"
echo "Compiling ..."
javac src/main/java/com/eneco/teaching/HelloWorld.java
echo "... Done!"
echo ""
echo ">> java -cp ./src/main/java/ com.eneco.project.HelloWorld"
java -cp ./src/main/java/ com.eneco.teaching.HelloWorld

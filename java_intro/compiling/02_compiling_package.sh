#!/bin/bash

# Hello World in package com.eneco.teaching on Command Line
echo ">> javac src/main/java/com/eneco/teaching/compiling/HelloWorld.java"
echo "Compiling ..."
javac src/main/java/com/eneco/teaching/compiling/HelloWorld.java
echo "... Done!"
echo ""
echo ">> java -cp ./src/main/java/ com.eneco.teaching.compiling.HelloWorld"
java -cp ./src/main/java/ com.eneco.teaching.compiling.HelloWorld

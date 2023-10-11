#!/bin/bash

# Compiling with maven
echo ">> mvn validate"
echo ""
mvn validate
echo ""
echo ">> mvn compile" # This include the validate step!
echo ""
mvn compile
echo ""
echo ">> java -cp ./target/classes com.eneco.teaching.compiling.HelloWorld"
echo ""
java -cp ./target/classes com.eneco.teaching.compiling.HelloWorld
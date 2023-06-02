#!/bin/bash

# Making a .jar with maven
echo ">> mvn package"
echo ""
mvn package
echo ""
echo ">> java -cp ./target/fundamentals-0.0.0.jar com.eneco.teaching.compiling.HelloWorld"
echo ""
java -cp ./target/compiling-0.0.0.jar com.eneco.teaching.compiling.HelloWorld
echo ""
echo ">> unzip ./target/compiling-0.0.0.jar -d unzipped_jar"
echo ""
mkdir unzipped_jar
unzip ./target/compiling-0.0.0.jar -d unzipped_jar
echo ""
echo ">> this is inside the jar (it's just a zip file):"
echo ""
tree unzipped_jar
rm -r unzipped_jar
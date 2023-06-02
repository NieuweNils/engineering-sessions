#!/bin/bash

# Making a .jar with maven
echo ""
echo ">> mvn package"
echo ""
mvn package
echo ""
echo ">> run with java -cp ./target/fundamentals-0.0.0.jar com.eneco.project.HelloWorld"
echo ""
java -cp ./target/fundamentals-0.0.0.jar com.eneco.teaching.HelloWorld
echo ""
echo ">> this is inside the jar (it's just a zip file):"
echo ""
mkdir unzipped_jar
unzip ./target/fundamentals-0.0.0.jar -d unzipped_jar
tree unzipped_jar
rm -r unzipped_jar


#echo ""
#echo ">> mvn integration-test"
#echo ""
#mvn integration-test
#echo ""
#echo ">> mvn verify"
#echo ""
#mvn verify
#echo ""
#echo ">> mvn install"
#echo ""
#mvn install

#echo ""
#echo ">> mvn clean install"
#echo ""
#mvn clean install
#echo ""
#echo ">> mvn clean install -DskipTests"
#echo ""
#mvn clean install -DskipTests

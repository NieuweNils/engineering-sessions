echo ""
echo "-----mvn package-----"
echo ""
mvn package
echo ""
echo "-----run with java -cp ./target/fundamentals-0.0.0.jar com.eneco.project.HelloWorld-----"
echo ""
java -cp ./target/fundamentals-0.0.0.jar com.eneco.teaching.HelloWorld
echo ""
echo "this is inside the jar:"
echo ""
mkdir unzipped_jar
unzip ./target/fundamentals-0.0.0.jar -d unzipped_jar
tree unzipped_jar
rm -r unzipped_jar
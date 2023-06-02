package com.eneco.teaching.oop;

public class DataTypes {
    public static void main(String[] args) {
        boolean boolVar = false;
        byte byteVar = 4;
        // A byte is of very limited size
        // byte aByteTooMuch = 7888888955; // this is too big for a byte
        short shortVar = 56;

        // this will give error as number is
        // larger than short range
        // short theBigShort = 87878787878;
        int intVar = 78;

        // by default fraction value
        // is double in java
        double doubleVar = 4.355453532;

        // for float use 'f' as suffix as standard
        float floatVar = 4.7333434f;
        // this is mega big
        long longVar = 12121;
        char charVar = 'a';
        // this does not work, because double quotes ("") are reserved for String objects
        // char charVar = "a";
        char[] charArray = {'m', 'o', 'r', 'e', ' ', 'c', 'h', 'a','r','s'};
        // Strings are an Object of the String class, not a primitive data type!
        String stringVar = "at least one character";

        System.out.println("boolean: " + boolVar);
        System.out.println("integer: " + intVar);
        System.out.println("byte: " + byteVar);
        System.out.println("short: " + shortVar);
        System.out.println("float: " + floatVar);
        System.out.println("double: " + doubleVar);
        System.out.println("long: " + longVar);
        System.out.println("char: " + charVar);
        System.out.println("char[]: " + charArray);
        for (int i = 0; i <= charArray.length-1; i++){
            System.out.println("char[" + String.valueOf(i) + "]: " + charArray[i]);
        }
        System.out.println("String: " + stringVar);

    }
}

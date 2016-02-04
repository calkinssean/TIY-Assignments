//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


for i in 1...100 {
    if i % 15 == 0 {
        print("fizzbuzz")
    } else if i % 5 == 0 {
        print("buzz")
    } else if i % 3 == 0 {
        print("fizz")
    } else {
        print(i)
    }
}
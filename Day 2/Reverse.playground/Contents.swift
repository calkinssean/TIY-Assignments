//: Playground - noun: a place where people can play


// Write a function named reverse that takes an array of integers named numbers as a parameter. The function should return an array with the numbers from numbers in reverse order.


import UIKit

var otherNumbers = [12,12,12,12,14,15,12]
var numbers = [1,2,3,4,5,6,7,8,9,10]

func reverse(N: [Int]) -> [Int] {
    
    return N.reverse()
    
}
reverse(numbers)
reverse(otherNumbers)
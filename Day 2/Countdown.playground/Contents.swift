//: Playground - noun: a place where people can play

import UIKit


import Foundation


func countdown(var N: Int) {
    if N > 0 {
        print(N)
        N = (N-1)
        sleep(1)
        countdown(N)
    } else {
        print("Go!")
    }
}
countdown(24)


func otherCountdown(var X: Int) {
    while X > 0 {
        print(X)
        X = (X-1)
        sleep(1)
    }
    print("Go!")
}
otherCountdown(5)

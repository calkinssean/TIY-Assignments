/* # Homework
###Tip Calculator

Create a new playgound file called "TipCalculator".

1. Create a function to calculate the tip amount. It should accept two values - totalAmount and percentage and return the total amount of the tip as well as the final total for the customer. Hint: *use tuples*

2. Create a Class called TipCalculator with one property called dollarAmount.

- It should have an *initializer* that accepts the dollarAmount

- It should have a function that calculates a tip it should accept a tipPercentage that is of type Double and returns the tipAmount of type Double.

- It should have a method called printPossibleTips() that calculates and prints the tip amount for three values 15%, 18% and 20%.

HARD MODE:

Write an App that uses a textField for the dollarAmount and tipPercentage and a button that calculates the final dollar amount to be paid.
*/




import UIKit

class TipCalculator {
    
    var dollarAmount: Double
    
    init(dollarAmount: Double) {
        self.dollarAmount = dollarAmount
    }
    func calculate(percentage: Double) -> Double {
        
        return self.dollarAmount * percentage
    }
    func printPossibleTips() {
        let fifteenPercent = calculate(0.15)
        let eighteenPercent = calculate(0.18)
        let twentyPercent = calculate(0.20)
        
        print("A 15% tip would cost \(fifteenPercent), an 18% tip would cost \(eighteenPercent), a 20% tip would cost \(twentyPercent)")
    }
}
let myTip = TipCalculator(dollarAmount: 15)
myTip.printPossibleTips()




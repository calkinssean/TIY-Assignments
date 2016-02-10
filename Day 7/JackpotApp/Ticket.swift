import UIKit

class Ticket {
    
    // MARK: - Properties
    
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    var number4: Int = 0
    var number5: Int = 0
    var number6: Int = 0
    
    
    init() {
        
    }
    
    // MARK: - Functions / Methods
    
    func generateTicket() {
        
        self.number1 = Int(arc4random_uniform(52)) + 1
        self.number2 = Int(arc4random_uniform(52)) + 1
        self.number3 = Int(arc4random_uniform(52)) + 1
        self.number4 = Int(arc4random_uniform(52)) + 1
        self.number5 = Int(arc4random_uniform(52)) + 1
        self.number6 = Int(arc4random_uniform(52)) + 1
        
    }
    
    func checkForWinningTicket(ticket: Ticket) -> Bool {
        if self.number1 == ticket.number1 && self.number2 == ticket.number2 && self.number3 == ticket.number3 && self.number4 == ticket.number4 && self.number5 == ticket.number5 && self.number6 == ticket.number6 {
            return true
        }
        return false
    }
    
    func generateWinningTicket() -> Ticket {
        let winningTicket = Ticket()
        
        return winningTicket
    }
    
    

}
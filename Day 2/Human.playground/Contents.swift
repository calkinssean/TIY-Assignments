/* ### Normal Mode

* [x] Create a Playground named Human.
* [x] Make a class named BodyPart.
* [ ] Create 20 classes that are subclasses of BodyPart.
* [ ] Each class should have 3 methods that are specific to that part.
* [ ] Each class should have 3 properties that are specific to that part.
*/

import UIKit

class BodyPart {
    var numberOfParts: Int
    var isBroken: Bool
    var isAttached: Bool
    var length: Int
    var tattoo: String
    var isPowerful: Bool
    var canDrinkBeer: Bool
    var numberOfJoints: Int
    var color: String
    
    init() {
        self.numberOfParts = 20
        self.isBroken = false
        self.isAttached = true
        self.length = 10
        self.tattoo = "I love Julie"
        self.isPowerful = false
        self.canDrinkBeer = false
        self.numberOfJoints = 10
        self.color = "Red"
    }
    func removeBodyPart() {
        if self.isAttached == false {
            print("\(self) has already been removed")
        } else if self.isAttached == true {
            self.isAttached = false
            print("\(self) has been removed")
        }
    }
    func hitWithHammer() {
        self.isBroken = true
        print("\(self) is broken!")
    }
    func attachBodyPart() {
        if self.isAttached == false {
            print("\(self) has been reattached!")
            self.isAttached = true
        } else if self.isAttached == true {
            print("\(self) is already attached!")
        }
    
    }
    func injectWithSteroids() {
        self.isPowerful = true
        print("\(self) is so powerful!!")
    }
    func removeTattoo() {
        self.tattoo = "*nasty scars*"
    }
    func doAnything() {
        if self.isAttached == false {
            print("\(self) is not attached!")
        } else {
            print("Things have been done")
        }
    }
    func drinkBeer() {
        if self.canDrinkBeer == true {
            print("\(self) likes to drink beer!")
        } else {
            print("\(self) can't drink beer")
        }
    }
}
class Hand : BodyPart {
    override init() {
        super.init()
        self.numberOfJoints = 15
        self.canDrinkBeer = false
        self.length = 8
        self.hitWithHammer()
        self.drinkBeer()
        self.injectWithSteroids()
        self.removeBodyPart()
    }
}
class Arm : BodyPart {
    override init() {
        super.init()
        self.numberOfParts = 1
        self.isBroken = false
        self.canDrinkBeer = false
    }
}
class Head : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = true
        self.tattoo = "cold blooded"
        self.isBroken = false
    }
}
class Finger : BodyPart {
    override init() {
        super.init()
        self.numberOfParts = 10
        self.numberOfJoints = 3
        self.length = 4
        self.tattoo = "Iron Yard"
    }
}
class Lungs : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = false
        self.isPowerful = false
        self.numberOfJoints = 0
    }
}
class Leg : BodyPart {
    override init() {
        super.init()
        self.length = 8
        self.numberOfParts = 2
        self.isPowerful = false
        self.isBroken = false
    }
}
class Feet : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = false
        self.numberOfJoints = 15
        self.isAttached = true
    }
}
class Toes : BodyPart {
    override init() {
        super.init()
        self.isBroken = false
        self.isPowerful = true
        self.isAttached = false
    }
}
class Ears : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = false
        self.numberOfParts = 2
        self.numberOfJoints = 0
    }
}
class Heart : BodyPart {
    override init() {
        super.init()
        self.length = 7
        self.isBroken = true
        self.numberOfJoints = 0
    }
}
class Nose : BodyPart {
    override init() {
        super.init()
        self.isBroken = false
        self.isPowerful = false
        self.canDrinkBeer = true
    }
}
class Eyes : BodyPart {
    override init() {
        super.init()
        self.numberOfParts = 12
        self.numberOfJoints = 0
        self.color = "Blue"
    }
}
class Neck : BodyPart {
    override init() {
        super.init()
        self.length = 9
        self.isAttached = true
        self.isBroken = true
    }
}
class Tongue : BodyPart {
    override init() {
        super.init()
        self.isAttached = false
        self.canDrinkBeer = false
        self.color = "Blue"
    }
}
class Teeth : BodyPart {
    override init() {
        super.init()
        self.numberOfParts = 2
        self.isBroken = true
        self.isPowerful = true
    }
}
class Stomach : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = true
        self.isPowerful = false
        self.isAttached = false
    }
}
class Kidneys : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = false
        self.isAttached = true
        self.isBroken = false
    }
}
class Trachea : BodyPart {
    override init() {
        super.init()
        self.canDrinkBeer = true
        self.isAttached = false
        self.color = "Purple"
    }
}
class EyeBrows : BodyPart {
    override init() {
        super.init()
        self.isAttached = true
        self.isBroken = false
        self.length = 600
        self.hitWithHammer()
    }
}
class Lips : BodyPart {
    override init() {
        super.init()
        self.isPowerful = true
        self.canDrinkBeer = true
        self.color = "Grey"
        self.doAnything()
    }
}
var leftArm = Arm()
var mouth = Head()
var rightArm = Arm()
var leftLeg = Leg()
var rightLeg = Leg()
var leftVentricle = Heart()
var aorta = Heart()
var allTeeth = Teeth()
leftArm.hitWithHammer()
leftArm.removeBodyPart()
leftArm.attachBodyPart()
leftArm.attachBodyPart()
leftArm.injectWithSteroids()
leftArm.drinkBeer()
mouth.drinkBeer()
Arm.drinkBeer(leftArm)
aorta.hitWithHammer()
allTeeth.removeBodyPart()
allTeeth.hitWithHammer()
mouth.removeBodyPart()
mouth.removeTattoo()
rightArm.removeBodyPart()
leftLeg.removeBodyPart()
rightLeg.removeBodyPart()
leftVentricle.hitWithHammer()
aorta.injectWithSteroids()
rightLeg.doAnything()

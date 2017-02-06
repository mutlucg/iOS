//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var speed : Double

    init(speed : Double){
        self.speed = speed
    }
    func printDescription(){
      print("Vehicle's speed is: \(self.speed) kmh.")
    }
}

class Bicycle : Vehicle {
    let hasBasket : Bool

    init(hasBasket : Bool, speed : Double){
        self.hasBasket = hasBasket
        super.init(speed : speed)
    }

    override func printDescription(){
        if self.hasBasket {
            print("\nThis is a bicycle. Bicycle's speed : \(self.speed) kmh, it has a basket.")
        }else {
            print("\nThis is a bicycle. Bicycle's speed : \(self.speed) kmh, it doesn't have a basket.")
        }
    }

    func calculateTravelTime(distance : Double)->Double{
        return distance / self.speed
    }
}

class Car : Vehicle {
    let gearbox : [Int : Double] = [1 : 20, 2 : 50, 3 : 90, 4 : 135, 5 : 190]

    init() {
        super.init(speed : 0)
    }

    override func printDescription(){
        print("This is a car. The speed it has in each gear is as the following:")
        for i in 1...5{
            if(i==1){print("For \(i)st gear: \(gearbox[i]!) kmh")}
            else if(i==2){print("For \(i)nd gear: \(gearbox[i]!) kmh")}
            else if(i==3){print("For \(i)rd gear: \(gearbox[i]!) kmh")}
            else {print("For \(i)th gear: \(gearbox[i]!) kmh")  }
       }
    }
    func calculateTravelTime(distance : Double, gear : Int)->Double{
        self.speed = gearbox[gear]!
        return distance / self.speed
    }
}

let distanceArray : [Double] = [150, 200, 30, 300, 125, 540, 42, 322, 1000]

var car = Car()
car.printDescription()

var bike = Bicycle(hasBasket : true,speed : 36)
bike.printDescription()

for dist in distanceArray{
    print("\nFor distance \(dist) kms... ")
    for gear in 1...5{
    print("It takes our car in gear \(gear)", car.calculateTravelTime(distance: dist, gear : gear), "hours")
    }
    print("\nIt takes our bike at \(bike.speed) kmh speed",bike.calculateTravelTime(distance: dist), "hours")
}

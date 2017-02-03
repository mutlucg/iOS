class Vehicle {
    var speed : Double

    init(speed : Double){
      self.speed = speed
    }
    func printDescription(){
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
        print("Bicycle's speed : \(self.speed) km, it has a basket.")
      }else {
        print("Bicycle's speed : \(self.speed) km, it doesn't have a basket.")
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
      print("This is a car. The speed it has at each gear is as the following:")
      for speed in gearbox{
          print("For \(speed.key)th gear: \(speed.value)")
      }

    }
    func calculateTravelTime(distance : Double, gear : Int)->Double{
      self.speed = gearbox[gear]!
      return distance / self.speed
    }

}

var car = Car()
print(car.calculateTravelTime(distance : 180, gear : 4), "hours")
car.printDescription()
var bike = Bicycle(hasBasket : true,speed : 50)
var byke = Bicycle(hasBasket : false,speed : 35)
bike.printDescription()
print(bike.calculateTravelTime(distance : 100), "hours")
byke.printDescription()
print(byke.calculateTravelTime(distance : 105), "hours")

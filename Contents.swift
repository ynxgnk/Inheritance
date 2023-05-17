import UIKit

/*
 
 Наследование - это когда классы могут порождать своих наследников и быть наследниками других классов.
 
 super -  то же что и self, только указывает не на собственный класс а на класс родителя.
 
 as! - casting
 
 final - чтоб запретить классу иметь наследников.
 
 */


class Vehicle {
    
    let brand: String
    let weight: Int
    
    init(brand: String, weight: Int) {
        self.brand = brand
        self.weight = weight
    }
    
    func go() {
        print("Its going")
    }
}

let vehicle = Vehicle(brand: "Bicycle", weight: 12)
vehicle.weight
vehicle.brand
vehicle.go()


class Car: Vehicle {
    let carType: String
    let enginePower: Int
    
    init(brand: String, weight: Int, carType: String, enginePower: Int) {
        self.carType = carType
        self.enginePower = enginePower
        super.init(brand: brand, weight: weight)
    }
    
    func klakson() {
        print("Bep-Bep")
    }
}

let bmw = Car(brand: "BMW", weight: 1500, carType: "Sedan", enginePower: 500)
let audi = Car(brand: "Audi", weight: 1600, carType: "Crossover", enginePower: 400)

var cars: [Car] = [bmw, audi]


final class SportCar: Car {
    
    let maxSpeed: Int
    
    init(brand: String, weight: Int, enginePower: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(brand: brand, weight: weight, carType: "Super Car", enginePower: enginePower)
    }
    
    
}

//class SportSportCar: SportCar {
    
//}

let ferrari = SportCar(brand: "Ferrari", weight: 1000, enginePower: 800, maxSpeed: 340)

let porsche = SportCar(brand: "Porsche", weight: 1100, enginePower: 700, maxSpeed: 320)

bmw.weight
bmw.go()
bmw.klakson()
bmw.carType
ferrari.carType

cars.append(ferrari)
cars.append(porsche)

cars[3].carType
cars[2].enginePower

(cars[3] as! SportCar).maxSpeed
(cars[0] as? SportCar)?.maxSpeed

var sportCars = [SportCar]()

for car in cars {
    if car is SportCar {
        sportCars.append((car) as! SportCar)
    }
}

for sportCar in sportCars {
    print(sportCar.brand)
}

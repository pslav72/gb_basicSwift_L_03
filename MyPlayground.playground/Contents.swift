//
//  main.swift
//  gb_basicSwift_L_03
//
//  Created by Вячеслав Поляков on 13.01.2021.
//

import UIKit

let delimiter = "============================"

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Transmission: String {
    case manual
    case auto
    case DSG
}

enum BodyType: String {
    case liftback
    case sedan
    case SUV
}

enum Navigation: String {
    case include
    case exclude
}

enum Manufacturer: String {
    case Lada
    case Skoda
    case Renault
    case Volvo
}

enum NumberOfBridges: String {
    case twoBriges
    case threBridges
}

enum DoorState {
    case open
    case close
}

enum EngineState {
    case started
    case stopped
}

enum Loading {
    case load
    case unload
}

struct SportCar {
    let color: UIColor
    let transmission: Transmission
    let bodytype: BodyType
    let navigation: Navigation
    let manufacturer: Manufacturer
    let doorState: DoorState
    let productionYear: Int
    var engineState: EngineState
    let sizeTrunk: Int
}

struct TrunkCar {
    let color: UIColor
    let transmission: Transmission
    let bodytype: BodyType
    let navigation: Navigation
    let manufacturer: Manufacturer
    let numberOfBridges: NumberOfBridges
    let doorState: DoorState
    let productionYear: Int
    var engineState: EngineState
    let sizeTrunk: Int
}

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
print("4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.")
struct EngineStarted {
    var engineState: EngineState
    var doorState: DoorState {
        get {
            if engineState == .started {
                return DoorState.close
            } else {
                return DoorState.open
            }
        }
    }
}
var engine = EngineStarted(engineState: .started)
print("Состояние дверей: \(engine.doorState).")

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
print(delimiter)
print("5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.")

struct CreateCar {
    var manufacturer = Manufacturer.Lada
    var colour = UIColor.red
    var bodytype = BodyType.sedan
    var transmission = Transmission.manual
    let productionYear = Calendar.current.dateComponents([.year], from: Date()).year!
    
    init() {
        return
    }
    
    init(manufacturer: Manufacturer, colour: UIColor, bodytype: BodyType, transmission: Transmission) {
        self.manufacturer = manufacturer
        self.colour = colour
        self.bodytype = bodytype
        self.transmission = transmission
    }
    
    init(transmission: Transmission)  {
        self.transmission = transmission
    }
    
    func printConsole(propertiesCar: Self) {
        print(delimiter)
        print(propertiesCar.manufacturer, propertiesCar.colour, propertiesCar.bodytype, propertiesCar.transmission, propertiesCar.productionYear)
    }
    
}

var createCar = CreateCar()
createCar.printConsole(propertiesCar: createCar)

createCar = CreateCar(manufacturer: .Renault, colour: .blue, bodytype: .SUV, transmission: .auto)
createCar.printConsole(propertiesCar: createCar)

createCar = CreateCar(transmission: .DSG)
createCar.printConsole(propertiesCar: createCar)

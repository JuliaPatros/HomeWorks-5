//
//  main.swift
//  HomeWorks-5
//
//  Created by Patros on 29.09.2021.
//

import Foundation

enum Windows: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}
enum Engine: String {
    case start = "Двигатель запущен"
    case stop = "Двигатель остановлен"
}

//MARK: протокол Car

protocol CarProtocol {
    var mark: String { get }
    var year: Int { get }
    var engineCapacity: Double { get }
    var enginePower: Int { get }
    var transmission: String { get }
    var volumeTrunk: Int { get  }
    var volumeTrunkComplete: Int { get set }
    var windowsStatus: Windows { get set }
    var engineStatus: Engine { get set }
}

//MARK: расширение для CarProtocol

extension CarProtocol {

    mutating func engineStart() {
        engineStatus = .start
        print(engineStatus.rawValue)
    }
    mutating func engineStop() {
        engineStatus = .stop
        print(engineStatus.rawValue)
    }
    mutating   func windowsOpen () {
        windowsStatus = .open
        print(windowsStatus.rawValue)
    }
    mutating   func windowsClose () {
        windowsStatus = .close
        print(windowsStatus.rawValue)
    }

}

//MARK: class SportCar, имплементирующий протокол Car

class SportCar: CarProtocol {
    let mark: String
    let year: Int
    let engineCapacity: Double
    let enginePower: Int
    let transmission: String
    let volumeTrunk: Int
    var volumeTrunkComplete: Int
    var windowsStatus: Windows
    var engineStatus: Engine
    let color: String
    let type: String
    let countDoor: Int

    init(
        mark: String,
        year: Int,
        engineCapacity: Double,
        enginePower: Int,
        transmission: String,
        volumeTrunk: Int,
        volumeTrunkComplete: Int,
        windowsStatus: Windows,
        engineStatus: Engine,
        color: String,
        type: String,
        countDoor: Int) {

        self.color = color
        self.type = type
        self.countDoor = countDoor
        self.mark = mark
        self.year = year
        self.engineCapacity = engineCapacity
        self.enginePower = enginePower
        self.transmission = transmission
        self.volumeTrunk = volumeTrunk
        self.volumeTrunkComplete = volumeTrunkComplete
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus

    }
}

//MARK: class TrunkCar, имплементирующий протокол Car

final class TrunkCar: CarProtocol {
    let mark: String
    let year: Int
    let engineCapacity: Double
    let enginePower: Int
    let transmission: String
    let volumeTrunk: Int
    var volumeTrunkComplete: Int
    var windowsStatus: Windows
    var engineStatus: Engine
    let trailer: Bool
    let trailerMark: String
    let fuel: String
    let weight: Double
    let loadCapacity: Int
    var load: Int
    let wheelFormula: String

    init (mark: String,
          year: Int,
          engineCapacity: Double,
          enginePower: Int,
          transmission: String,
          volumeTrunk: Int,
          volumeTrunkComplete: Int,
          windowsStatus: Windows,
          engineStatus: Engine,
          trailer: Bool,
          trailerMark: String,
          fuel: String,
          weight: Double,
          loadCapacity: Int,
          load: Int,
          wheelFormula: String) {

        self.mark = mark
        self.year = year
        self.engineCapacity = engineCapacity
        self.enginePower = enginePower
        self.transmission = transmission
        self.volumeTrunk = volumeTrunk
        self.volumeTrunkComplete = volumeTrunkComplete
        self.windowsStatus = windowsStatus
        self.engineStatus = engineStatus
        self.trailer = trailer
        self.trailerMark = trailerMark
        self.fuel = fuel
        self.weight = weight
        self.loadCapacity = loadCapacity
        self.load = load
        self.wheelFormula = wheelFormula
    }

    func trailerTunk () -> String {
        trailer ? (trailerMark) : "отсутствует"
    }
    func trunkAdd (freight: Int) {
        load + freight < loadCapacity ? load += freight : print("не загрузим")
    }
    func trunkRemove (freight: Int) {
        load - freight >= 0 ? load -= freight : print("столько нет груза")
    }
}

//MARK: расширение, импл протокол CustomStringConvertible

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        Автомобиль - \(mark) \(year) г.в.
        \(color) \(countDoor)-х дверный \(type)
        объем двигателя - \(engineCapacity), мощность - \(enginePower) л.с., \(transmission)
        занято в багажнике \(volumeTrunkComplete) из \(volumeTrunk)
        \(windowsStatus.rawValue) и \(engineStatus.rawValue)
        """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
        Автомобиль - \(mark) \(year) г.в.
        прицеп - \(trailerTunk())
        объем двигателя - \(engineCapacity), мощность - \(enginePower) л.с., \(transmission)
        занято в прицепе \(load) из \(loadCapacity)
        \(windowsStatus.rawValue) и \(engineStatus.rawValue)
        """
    }
}

//MARK: вызов экземпляра
var carOne = SportCar(mark: "Hyundai Tiburon",
                      year: 1996,
                      engineCapacity: 2.0,
                      enginePower: 139,
                      transmission: "АКПП",
                      volumeTrunk: 360,
                      volumeTrunkComplete: 10,
                      windowsStatus: .close,
                      engineStatus: .stop,
                      color: "черный",
                      type: "хэтчбек",
                      countDoor: 2)
var carTwo = TrunkCar(mark: "DAf",
                      year: 1998,
                      engineCapacity: 12.9,
                      enginePower: 410,
                      transmission: "МКПП",
                      volumeTrunk: 0,
                      volumeTrunkComplete: 0,
                      windowsStatus: .open,
                      engineStatus: .start,
                      trailer: true,
                      trailerMark: "Wielton",
                      fuel: "Дизель",
                      weight: 10.5,
                      loadCapacity: 20,
                      load: 0,
                      wheelFormula: "6x2")

carOne.volumeTrunkComplete += 40
print(carOne)
print("--------")
carTwo.trunkAdd(freight: 10)
carTwo.windowsStatus = .close
print(carTwo)




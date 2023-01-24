//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Pierre Buclez on 16/01/2023.
//

import XCTest
@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        let car = Car(make: "Ferrari", model: "SF90", topSpeed: 211, acceleration: 2.5, handling: 8)
        XCTAssertEqual(car.make, "Ferrari")
        XCTAssertEqual(car.model, "SF90")
        XCTAssertEqual(car.topSpeed, 211)
        XCTAssertEqual(car.acceleration, 2.5)
        XCTAssertEqual(car.handling, 8)
    }
    func testCarGetStatsAsPerPropertyValues() {
        let car = Car(make: "Ferrari", model: "SF90", topSpeed: 211, acceleration: 2.5, handling: 8)
        let expected = """
        Make: Ferrari
        Model: SF90
        Top Speed: 211mph
        Acceleration (0-60): 2.5s
        Handling: 8
        """
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }

}

//
//  TappableSpaceXTests.swift
//  TappableSpaceXTests
//
//  Created by Guilherme Medeiros on 21/02/2021.
//

import XCTest
@testable import TappableSpaceX

class TappableSpaceXTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testRocketViewModel() {
        let rocket = Rocket(
            flickrImages: ["Image 01", "Image 02"],
            name: "Name of the Rocket",
            type: "Some type",
            active: true,
            costPerLaunch: 10,
            successRatePct: 90,
            firstFlight: "2006-03-24",
            country: "Some Country",
            wikipedia: "www.wikipedia.com",
            rocketDescription: "Awesome Rocket here",
            id: "011001001"
        )
        let rocketViewModel = RocketViewModel(rocket: rocket)

        XCTAssertEqual(
            rocket.flickrImages.first ?? "",
            rocketViewModel.rocketImage
        )
        XCTAssertEqual(
            "Rocket Name: \(rocket.name ?? "")",
            rocketViewModel.name
        )
        XCTAssertEqual(
            rocket.active ? "Rocket is active" : "Rocket is not active",
            rocketViewModel.active
        )
        XCTAssertEqual(
            rocket.costPerLaunch,
            rocketViewModel.costPerLaunch)
        XCTAssertEqual(
            rocket.successRatePct,
            rocketViewModel.successRatePct)
        XCTAssertEqual(
            "\(Date.getFormattedDate(string: rocket.firstFlight ?? ""))",
            rocketViewModel.firstFlight)
        XCTAssertEqual(
            rocket.country,
            rocketViewModel.country)
        XCTAssertEqual(
            rocket.wikipedia,
            rocketViewModel.wikipedia)
        XCTAssertEqual(
            rocket.rocketDescription,
            rocketViewModel.rocketDescription)
        XCTAssertEqual(
            rocket.id,
            rocketViewModel.id)




    }

}

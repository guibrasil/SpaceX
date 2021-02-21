//
//  RocketViewModel.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import Foundation
import UIKit

struct RocketViewModel {

    let rocketImage: String
    let name: String?
    let type: String?
    let active: String
    let costPerLaunch: Int?
    let successRatePct: Int?
    let firstFlight: String?
    let country: String?
    let wikipedia: String?
    let rocketDescription: String?
    let id: String

    init(rocket: Rocket) {
        self.rocketImage = rocket.flickrImages.first ?? ""
        self.name = "Rocket Name: \(rocket.name ?? "")"
        self.type = rocket.type
        self.active = rocket.active ? "Rocket is active" : "Rocket is not active"
        self.costPerLaunch = rocket.costPerLaunch
        self.successRatePct = rocket.successRatePct
        self.firstFlight = "\(Date.getFormattedDate(string: rocket.firstFlight ?? ""))"
        self.country = rocket.country
        self.wikipedia = rocket.wikipedia
        self.rocketDescription = rocket.rocketDescription
        self.id = rocket.id
    }

}

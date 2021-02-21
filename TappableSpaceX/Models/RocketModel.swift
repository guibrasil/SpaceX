//
//  Rocket Model.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 19/02/2021.
//

import Foundation

struct Rocket: Codable {
    let flickrImages: [String]
    let name: String?
    let type: String?
    let active: Bool
    let costPerLaunch: Int?
    let successRatePct: Int?
    let firstFlight: String?
    let country: String?
    let wikipedia: String?
    let rocketDescription: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case flickrImages = "flickr_images"
        case name, active, type
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, wikipedia
        case rocketDescription = "description"
        case id
    }
}

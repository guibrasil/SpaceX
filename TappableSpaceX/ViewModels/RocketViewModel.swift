//
//  RocketViewModel.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import Foundation
import UIKit
import SwiftUI

struct RocketViewModel {

    var rocket: Rocket?

    var title: String? {
        return rocket?.name
    }

    var rocketImageUrl: String {
        return rocket?.flickrImages.first ?? ""
    }

    var type: String? {
        return rocket?.type
    }

    var active: String {
        return rocket?.active ?? false ? "Active Rocket" : "Unactive Rocket"
    }

    var costPerLaunch: Int? {
        return rocket?.costPerLaunch
    }

    var successRatePct: Int? {
        return rocket?.successRatePct
    }

    var firstFlight: String? {
        return Date.getFormattedDate(string: rocket?.firstFlight ?? "")
    }

    var country: String? {
        return rocket?.country
    }

    var wikipediaUrl: String? {
        return rocket?.wikipedia
    }

    var rocketDescription: String? {
        return rocket?.rocketDescription
    }

    var id: String? {
        return rocket?.id
    }

    func badgeColorOutput() -> (UIColor, Color) {
        if let successRate = successRatePct {
            if successRate < 30 {
                return (.red, Color.red)
            } else if successRate >= 30 && successRate < 60 {
                return (.orange, Color.orange)
            } else {
                return (.green, Color.green)
            }
        }
        return (.white, Color.white)
    }

}

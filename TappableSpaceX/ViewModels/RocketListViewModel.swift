//
//  RocketListViewModel.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 01/03/2021.
//

import Foundation


class RocketListViewModel {

    var rocketsList: [RocketViewModel]

    init() {
        self.rocketsList = [RocketViewModel]()
    }

    func rocketViewModelIndex(at index: Int) -> RocketViewModel {
        return self.rocketsList[index]
    }

    func numberOfRockets() -> Int {
        return self.rocketsList.count
    }
}

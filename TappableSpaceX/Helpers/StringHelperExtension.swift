//
//  StringHelperExtension.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 21/02/2021.
//

import Foundation
import UIKit

extension String {
    func loadImage() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {}

        return UIImage()

    }
}

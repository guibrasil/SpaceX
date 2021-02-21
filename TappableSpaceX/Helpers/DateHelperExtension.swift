//
//  DateHelperExtension.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import Foundation

extension Date {
    static func getFormattedDate(string: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"

        guard let date: Date = dateFormatterGet.date(from: string) else { return "No Date" }
        return dateFormatterPrint.string(from: date)
    }
}

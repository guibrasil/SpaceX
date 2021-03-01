//
//  TappableSpaceXMainCell.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import UIKit

class TappableSpaceXMainCell: UITableViewCell {

    @IBOutlet private var itemImageView: UIImageView?
    @IBOutlet private var rocketNameLabel: UILabel?
    @IBOutlet private var dateLabel: UILabel?
    @IBOutlet var badgeView: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCellData(viewModel: RocketViewModel, with style: Style) {
        self.rocketNameLabel?.text = viewModel.title
        self.rocketNameLabel?.font = style.nameFont
        self.rocketNameLabel?.textColor = style.nameColor

        self.dateLabel?.text = "First Launch: \(viewModel.firstFlight ?? "")"
        self.dateLabel?.font = style.dateFont
        self.dateLabel?.textColor = style.dateColor

        self.itemImageView?.layer.cornerRadius = style.imageRadius
        if let url = URL(string: viewModel.rocketImageUrl) {
            self.itemImageView?.load(url: url)
        }
        self.badgeView?.backgroundColor = viewModel.badgeColorOutput().0

    }
}

extension TappableSpaceXMainCell {
    struct Style {
        let imageRadius: CGFloat
        let nameColor: UIColor
        let nameFont: UIFont
        let dateColor: UIColor
        let dateFont: UIFont

        static let baseStyle = Style(
            imageRadius: 6,
            nameColor: .black,
            nameFont: UIFont.systemFont(ofSize: 16, weight: .heavy),
            dateColor: .black,
            dateFont: UIFont.systemFont(ofSize: 10, weight: .regular)

        )
    }
}


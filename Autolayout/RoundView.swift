//
//  RoundView.swift
//  Autolayout
//
//  Created by myronishyn.ihor on 26.03.2022.
//

import UIKit

/// This class display the required number of characters of the password.
final class RoundView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRounded(borderColour: .darkText, borderWidth: 1.0)
    }
}

extension UIView {
    func makeRounded(borderColour: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = (frame.size.width < frame.size.height) ? frame.size.width / 2.0 : frame.size.height / 2.0
        layer.borderColor = borderColour.cgColor
        layer.borderWidth = borderWidth
    }
}

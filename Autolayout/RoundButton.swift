//
//  RoundButton.swift
//  Autolayout
//
//  Created by myronishyn.ihor on 26.03.2022.
//

import UIKit

class RoundButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRounded(borderColour: .darkText, borderWidth: 1.0)
    }
}

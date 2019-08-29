//
//  FGPageHeader.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/27/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FGPageHeader: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var selectedView: UIView!
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                selectedView.alpha = 1
                titleLabel.style(FGPageStyled.shared().headerTitle)
            } else {
                selectedView.alpha = 0
                titleLabel.style(FGPageStyled.shared().headerTitleSelected)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = FGPageStyled.shared().headerBGColor
        titleLabel.style(FGPageStyled.shared().headerTitle)
        selectedView.alpha = 0
        selectedView.backgroundColor = FGPageStyled.shared().headerBGSelected
    }
    
    func display(title: String) {
        titleLabel.text = title
    }
}

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
            selectedView.alpha = isSelected ? 1 : 0
            selectedView.backgroundColor = isSelected ? FGPageStyled.shared().headerBGSelected : UIColor.clear
            titleLabel.style(isSelected ? FGPageStyled.shared().headerTitleSelected : FGPageStyled.shared().headerTitle)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = UIColor.clear
        titleLabel.style(FGPageStyled.shared().headerTitle)
    }

    func display(title: String) {
        titleLabel.text = title
    }
}

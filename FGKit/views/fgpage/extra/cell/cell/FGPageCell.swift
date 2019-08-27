//
//  FGPageCell.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/27/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FGPageCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func addView(view: UIView) {
        FGLayout.fill(view: view, container: contentView)
    }
}

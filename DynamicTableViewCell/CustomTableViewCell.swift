//
//  CustomTableViewCell.swift
//  DynamicTableViewCell
//
//  Created by Tsunemasa Hachiya on 2018/01/29.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate {
    func didTappedShowMoreButton(cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {

    var isOpen = false
    var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var showMoreButtonHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func showMoreButtonAction(_ sender: UIButton) {
        contentLabel.numberOfLines = 0
        showMoreButtonHeightConstraint.constant = 0
        showMoreButton.isHidden = true
        self.delegate?.didTappedShowMoreButton(cell: self)
    }
    
}

//
//  HZViewCell.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import UIKit

class HZViewCell: UITableViewCell {
    
    @IBOutlet weak var hzText: UILabel!
    
    static let identifier: String = "HZViewCell"
    
    weak var viewModel: CellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            hzText.text = viewModel.hzText
        }
    }
}

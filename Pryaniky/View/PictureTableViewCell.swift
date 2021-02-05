//
//  PictureTableViewCell.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import UIKit
import Kingfisher

class PictureTableViewCell: UITableViewCell {
    static let identifier: String = "PictureTableViewCell"
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var hzText: UILabel!
    
    weak var viewModel: CellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            hzText.text = viewModel.hzText
            guard let imageUrlString = viewModel.imageUrl else { return }
            guard let imageUrl = URL(string: imageUrlString) else { return }
            self.dataImage.kf.setImage(with: imageUrl)
            
            
        }
    }
}

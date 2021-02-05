//
//  SelectorTableViewCell.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import UIKit

class SelectorTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var selector: UIPickerView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "SelectorTableViewCell"
    var pickerData: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selector.delegate = self
        selector.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        titleLabel.text = pickerData[selectedRow]
    }
    
    weak var viewModel: CellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            guard let variants = viewModel.variants else { return }
            pickerData = variants

        }
    }
}

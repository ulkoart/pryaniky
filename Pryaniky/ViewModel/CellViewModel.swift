//
//  CellViewModel.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation


class CellViewModel: CellViewModelType {
    private var data: ApiData
    
    init(with data: ApiData) {
        self.data = data
    }
    
    var hzText: String {
        return data.data.text ?? "NoValue"
    }
    
    var imageUrl: String? {
        return data.data.url
    }
    
    var variants: [String]? {
        guard let variants = data.data.variants else { return nil }
        return variants.map { $0.text }
    }
}

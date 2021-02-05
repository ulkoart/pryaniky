//
//  CellViewModelType.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation


protocol CellViewModelType: class {
    var hzText: String { get }
    var variants: [String]? { get }
    var imageUrl: String? { get }
}

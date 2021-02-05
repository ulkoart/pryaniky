//
//  ViewModelType.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation

protocol ViewModelType {   
    func numberOfRows() -> Int
    func fetchData(completionHandler: @escaping() -> ())
    func selectRow(atIndexPath indexPath: IndexPath)
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType?
    func getCellType(forIndexPath indexPath: IndexPath) -> ViewType?
    
}

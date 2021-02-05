//
//  ViewController.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var viewModel: ViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white

        self.title = "Pryaniky.com"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel = ViewModel()
        viewModel?.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellType = viewModel?.getCellType(forIndexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        
        switch cellType {
            
        case .hz:
            let cell = tableView.dequeueReusableCell(withIdentifier: HZViewCell.identifier, for: indexPath) as! HZViewCell
            cell.viewModel = cellViewModel
            return cell
        
        case .selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorTableViewCell.identifier, for: indexPath) as! SelectorTableViewCell
            cell.viewModel = cellViewModel
            return cell

        case .picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.identifier, for: indexPath) as! PictureTableViewCell
            cell.viewModel = cellViewModel
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(atIndexPath: indexPath)
    }
}


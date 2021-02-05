//
//  ViewModel.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import UIKit


class ViewModel: ViewModelType {

    private var selectedIndexPath: IndexPath?
    private var view = [ViewType]()
    private var data = [ApiData]()
    
    private func showAlert(){
        guard let selectedIndexPath = selectedIndexPath else { return }
        guard let data = getData(forIndexPath: selectedIndexPath) else { return }
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        
        let alertController = UIAlertController(
            title: "Информация",
            message: data.name.rawValue,
            preferredStyle: UIAlertController.Style.alert
        )
        
        alertController.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.cancel, handler: { _ in
            alertWindow.isHidden = true
        }))
        
        alertWindow.windowLevel = UIWindow.Level.alert + 1;
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func numberOfRows() -> Int {
        return view.count
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        showAlert()
    }
    
    func fetchData(completionHandler: @escaping() -> ()) {
        NetworkManagerImp.getApiResponse {[weak self] apiResponse, error in
            guard let apiResponse = apiResponse else { return }
            self?.view = apiResponse.view
            self?.data = apiResponse.data
            completionHandler()
        }
    }
    
    private func getData(forIndexPath indexPath: IndexPath) -> ApiData? {
        let filtered = self.data.filter { data in
            return data.name == self.view[indexPath.row]
        }
        guard let data: ApiData = filtered.first else { return nil }
        return data
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        guard let data = getData(forIndexPath: indexPath) else { return nil }
        return CellViewModel(with: data)
    }
    
    func getCellType(forIndexPath indexPath: IndexPath) -> ViewType? {
        return self.view[indexPath.row]
    }
}

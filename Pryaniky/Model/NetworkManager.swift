//
//  NetworkManager.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation


protocol NetworkManager {
    typealias ApiResponseCompletion = (ApiResponse?, Error?) -> Void
    static func getApiResponse(completionHandler: @escaping ApiResponseCompletion)
}

final class NetworkManagerImp: NetworkManager {
    
    static let apiUrl = "https://pryaniky.com/static/json/sample.json"
    
    static func getApiResponse(completionHandler: @escaping ApiResponseCompletion) {
        guard let url = URL(string: self.apiUrl) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(ApiResponse.self, from: data)
                completionHandler(apiResponse, nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

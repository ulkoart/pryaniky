//
//  ApiResponse.swift
//  Pryaniky
//
//  Created by user on 04/02/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation

struct Variant: Codable {
    let id: Int
    let text: String
}

struct DataStruct: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
   
}

struct ApiData: Codable {
    let name: ViewType
    let data: DataStruct
}

enum ViewType: String, Codable {
   case hz = "hz"
   case selector = "selector"
   case picture = "picture"
}

struct ApiResponse: Codable {
    let data: [ApiData]
    let view: [ViewType]
}

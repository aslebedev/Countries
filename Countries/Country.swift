//
//  Country.swift
//  Countries
//
//  Created by alexander on 22.11.2019.
//  Copyright © 2019 alexander. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let population: Int
    let description: String
    
    var countryInfo: [String] {
        var array = [String]()
        let mirror = Mirror(reflecting: self)
        for property in mirror.children {
            let value = String(describing: property.value)
            if !value.isEmpty {
                array.append(value)
            }
        }
        return array
    }
    
    func properiesCount() -> Int {
        let mirror = Mirror(reflecting: self)
        return mirror.children.count
    }
}

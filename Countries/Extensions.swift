//
//  Extensions.swift
//  Countries
//
//  Created by alexander on 14.01.2020.
//  Copyright © 2020 alexander. All rights reserved.
//

import Foundation

//  MARK: Specialized capitalization that uppercases only the first letter in our string
extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
}

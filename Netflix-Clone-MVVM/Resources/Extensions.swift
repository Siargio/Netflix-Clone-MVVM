//
//  Extensions.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 28.12.22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

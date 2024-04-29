//
//  String+Extensions.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/29.
//

import Foundation

extension String {
    var isEmptyOrWithWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

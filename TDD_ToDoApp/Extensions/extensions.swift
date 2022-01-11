//
//  extensions.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 11.01.22.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "!@#$%ˆ&*()-=[]\\{},.?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}

//
//  PassordGenerator.swift
//  SuperSenha
//
//  Created by Abner Lima on 11/02/23.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "0123456789"
    private let specialCharacters = "!@#$%&_-+=*<>(),.;:{}[]"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        var numbers = min(numberOfCharacters, 16)
        numbers = max(numbers, 1)
        
        self.numberOfCharacters = numbers
        self.numberOfPasswords = numberOfPasswords
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var passord = ""
            
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                passord += String(universeArray[index])
            }
            
            passwords.append(passord)
        }
        
        return passwords
    }
}

//
//  WordController.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/24/23.
//

import Foundation

struct WordController {
    
    let testWord: String = "WHAT"
    
    func shuffleWord(_ word: String) -> String {
        // Code to shuffle the word
        var ansString : String = ""
        
        ansString = String(word.shuffled())

        if (ansString == word) {
            return "BAD"
        } else {
            return ansString
        }
       
    }
    
    func generateRandomWord() -> (String,String) {
        // Implement logic to generate a random word
        // Here's an example of generating a random word from an array of words
        var toReturn : String = ""
        
        let words = ["apple", "banana", "cherry", "orange", "pear"]
        let randomIndex = Int.random(in: 0..<words.count)
        
        //Don't want the word itself showing
        toReturn = shuffleWord(words[randomIndex])
        return (words[randomIndex],toReturn)
    }
    
    
}

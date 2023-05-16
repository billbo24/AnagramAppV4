//
//  WordController.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/24/23.
//

import Foundation

class WordController {
    
    let testWord: String = "WHAT"
    private var allWords : [String] = []
    
    init() {
        //Apparently this is where we can put code to get executed the moment we initialize our predator controller
        importDictionary()
    }
    
    func importDictionary() {
        if let filepath = Bundle.main.path(forResource: "Words", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                allWords = contents.components(separatedBy: .newlines)
                print("Import may have worked")
            } catch {
                // Handle error
                print("Import definitely didn't work")
            }
        }
    }
    
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
        
        //let words = ["apple", "banana", "cherry", "orange", "pear"]
        let randomIndex = Int.random(in: 0..<allWords.count)
        
        //Don't want the word itself showing
        toReturn = shuffleWord(allWords[randomIndex])
        return (allWords[randomIndex],toReturn)
    }
    
    
}

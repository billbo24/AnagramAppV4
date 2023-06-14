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
    //private var allWords : [String] = ["Auctioned","Cautioned"]
    //This implements this as a set. Similar to a dictionary but a bit simpler.  Got that nice lookup
    var allWordsDictionary: Set<String> = []
    //var allWordsDictionary: Set<String> = ["Auctioned","Cautioned"]
    
    let minLength : Int = 4//Maximum word length.  Can't find where I did this
    let maxLength : Int = 6 //Maximum word length.  Can't find where I did this
    
    init() {
        //Apparently this is where we can put code to get executed the moment we initialize our predator controller
        importDictionary()
        
    }
    
    func importDictionary() {
        if let filepath = Bundle.main.path(forResource: "HugeDictionary", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                allWords = contents.components(separatedBy: .newlines)
                
                //Basically the same as above, but just make it a set
                allWordsDictionary = Set(contents.components(separatedBy: .newlines))
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
        var randomIndex = Int.random(in: 0..<allWords.count)
        
        
        
        //Don't want the word itself showing
        toReturn = shuffleWord(allWords[randomIndex])
        
        //Wanna make sure the word isn't obscenely long
        while toReturn.count > maxLength || toReturn.count < minLength {
            randomIndex = Int.random(in: 0..<allWords.count)
            toReturn = shuffleWord(allWords[randomIndex])
        }
        
        return (allWords[randomIndex],toReturn)
    }
    
    func checkAnagram(_ guessWord:String,_ ansWord:String) -> Bool {
        //This is where we'll check if something is an anagram.  Basically all we need to do it:
        //check if it's an anagram (sort it) and then see if it's in the dictionary
        
        //Lowercase and sort both strings
        let firstString = String(guessWord.lowercased().sorted())
        let secondString = String(ansWord.lowercased().sorted())
        
        if firstString == secondString {
            //print("They're equal, now let's check if the guess is in the dictionary")
            //print("guessed \(guessWord) and answer is \(ansWord)")
            if allWordsDictionary.contains(guessWord.lowercased()) {
                //This means they're anagrams and both are in the dictionary!
                return true
            } else {
                //This means the second word isn't in the dictionary
                return false
            }
        }
        return false //this means the words weren't anagrams
    }
    
    
}

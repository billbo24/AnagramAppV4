//
//  WordObject.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/23/23.
//

//Important note here, it can be a little tricky to troubleshoot sometimes.  Remember that the thing being displayed here is hardcoded below.  Anytime we click the "add word" thing it refreshes the preview thing according to our inputs.  This works in the game page

import SwiftUI

struct WordObject: View {
    @Binding var curWord : String
    @Binding var outputWord : String
    
    var numLetters : Int
    
    //This will give us an array of all the individual letters
    var letters: [String] {
        let characters = Array(curWord) //Splits word into an array
        //characters.shuffle() don't need this just yet
        
        //This turns each character into a string.  Formerly I think they would be...I'm not sure I guess.  But the $0 loops over each element
        return characters.map { String($0) }
    }
    
    //Get the length of the array
    var arrayLength: Int {
        return letters.count
    }
    
    //Return letter size
    
    var letterSize: CGFloat {
        //0.8 seems to be enough to account for the spacing between the letters and still fit them all on screen
        //arrayLength
        return 0.8*UIScreen.main.bounds.width / CGFloat(numLetters)
    }
    
    
    var body: some View {
        HStack{
            ForEach(letters.indices,id:\.self){
                letter in //I believe this is a number 
                LetterObject(letter: letters[letter], width: letterSize, height: letterSize).onTapGesture{
                    //This is where we add the letter to the output word
                    outputWord += letters[letter]
                    
                    print("numLetters is \(numLetters)")
                    //We also need to remove the letter from the input word.  This one is not as straightforward and we must remove the letter we want by removing the index.  I
                    let stringIndex = curWord.index(curWord.startIndex, offsetBy: letter)

                    curWord.remove(at: stringIndex)
                    print("\(outputWord) is the word")
                }
                
            }
        }
    }
        
    
    
    
}

struct WordObject_Previews: PreviewProvider {
    static var previews: some View {
        WordObject(curWord:.constant("pepper"),outputWord: .constant(""),numLetters: 4)
    }
}

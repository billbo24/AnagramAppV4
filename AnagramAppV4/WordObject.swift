//
//  WordObject.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/23/23.
//

import SwiftUI

struct WordObject: View {
    @Binding var curWord : String
    
    //This will give us an array of all the individual letters
    var letters: [String] {
        let characters = Array(curWord) //Splits it into an array
        //characters.shuffle() don't need this just yet
        return characters.map { String($0) }
    }
    
    //Get the length of the array
    var arrayLength: Int {
        return letters.count
    }
    
    //Return letter size
    var letterSize: CGFloat {
        //0.8 seems to be enough to account for the spacing between the letters and still fit them all on screen
        return 0.8*UIScreen.main.bounds.width / CGFloat(arrayLength)
    }
    
    
    var body: some View {
        HStack{
            ForEach(letters.indices,id:\.self){
                letter in
                LetterObject(letter: letters[letter], width: letterSize, height: letterSize)
                
            }
        }
    }
        
    
    
    
}

struct WordObject_Previews: PreviewProvider {
    static var previews: some View {
        WordObject(curWord:.constant("pepper"))
    }
}

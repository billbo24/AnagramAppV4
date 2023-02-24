//
//  ContentView.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    @State var displayWord : String = ""
    @State var answerWord : String = ""
    @State var typingBool = false
    @State var guessWord: String = ""
    
    
    let myController : WordController
    
    init() {
        self.myController = WordController()
        var (firstAnswer,randomWord) = myController.generateRandomWord()
        //let answerWord = randomWord
        //I think we have to do the underscore stuff because it's a state variable
        self._displayWord = State(initialValue: randomWord)
        self._answerWord = State(initialValue: firstAnswer)
        
    }
    
    
    
    var body: some View {
        //Text(word)
        
        VStack {
            Spacer()
            HStack {
                WordObject(curWord: $displayWord)
                }
            
            Button("Shuffle") {
                //No need to update the answer word here
                displayWord = myController.shuffleWord(displayWord)
            }
            .padding()
            Button("New Word"){
                (answerWord,displayWord) = myController.generateRandomWord()
            }
            
            TextField("Guess",text:$guessWord,onEditingChanged:
                {
                typing in //onEditingChanged I think is a boolean, and this is the inherent property.  It's a boolean
                typingBool = typing //I think this is saying whether or not the person is typing (boolean)
                
                }
            )
            
            .background(Color.white)
            Spacer()
            
        }
        .padding()
        .background(Color.yellow)
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

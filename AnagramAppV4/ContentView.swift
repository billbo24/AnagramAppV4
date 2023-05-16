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
    @State var answerTally: Int = 0 //Initial Score
    @State var showingAlert = false
    @State var alertText : String = ""
    
    let myController : WordController
    
    init() {
        self.myController = WordController()
        let (firstAnswer,randomWord) = myController.generateRandomWord()
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
            
            Button("Check Answer"){
                showingAlert = true
                
                
                if guessWord.lowercased() == answerWord {
                    alertText = "You guessed it right"
                    answerTally += 1 //increment correct guesses
                    (answerWord,displayWord) = myController.generateRandomWord()
                } else {
                    alertText = "Wrong! try again"
                    //Nothing else changes
                }
                
                guessWord = ""
            }
            .background(Color.white)
            .padding()
            
            Button("Give Up"){
                showingAlert = true
                
                answerTally = 0
                alertText = "The correct answer was \(answerWord)"
                (answerWord,displayWord) = myController.generateRandomWord()
                
                
                guessWord = ""
            }
            .background(Color.white)
            .padding()
            
            Text("Total number correct is \(answerTally)")
            
            
            Spacer()
            
        }
        .padding()
        .background(Color.yellow)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Message"), message: Text(alertText), dismissButton: .default(Text("OK")))

        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

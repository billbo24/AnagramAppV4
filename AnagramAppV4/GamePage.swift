//
//  GamePage.swift
//  AnagramAppV4
//
//  Created by William Floyd on 5/17/23.
//

import SwiftUI

struct GamePage: View {
    @State var displayWord : String = ""
    @State var answerWord : String = ""
    @State var answerDisplayWord : String = ""
    
    
    @State var typingBool = false
    @State var guessWord: String = ""
    @State var answerTally: Int = 0 //Initial Score
    @State var showingAlert = false
    @State var alertText : String = ""
    
    @EnvironmentObject var persistentVariables : PersistentVariables
    
    
    
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
        
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                
                
                Spacer()
                //Gonna put these two things into a VSTACK
                VStack(alignment:.leading){
                    let wordLength = answerWord.count
                    let spacingSize = UIScreen.main.bounds.width / CGFloat(answerWord.count)
                    
                    //This could be the "staging word"
                    //Ternary operator lets us conditionally put spacing
                    WordObject(curWord: $displayWord,outputWord: $answerDisplayWord,numLetters: wordLength).transition(.slide).padding(.bottom,answerDisplayWord == "" ? spacingSize : 0)
                    
                    
                    //This will be our kinda answer display word
                    WordObject(curWord: $answerDisplayWord,outputWord:$displayWord,numLetters: wordLength).transition(.slide).padding(.top,displayWord == "" ? spacingSize : 0)
                
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    //maxHeight: .infinity,
                    alignment: .topLeading
                  )
                
                
                Button("Shuffle") {
                    //No need to update the answer word here
                    //Note the way the animation works.  Apparently withAnimation will make the letters slide to a new spot typically, but the way I've coded it makes this a new view? I think at least.  Because of this it uses the "dissolve" transition
                    withAnimation(.easeInOut(duration: 0.5)) {
                        displayWord = myController.shuffleWord(displayWord)
                    }
                }
                .padding()
                
                Button("New Word"){
                    withAnimation {
                        (answerWord,displayWord) = myController.generateRandomWord()
                    }
                }
                

                
                
                Button("Check Answer"){
                    showingAlert = true
                    
                    
                    //if guessWord.lowercased() == answerWord {
                    //Gonna try using the anagram checker directly
                    if myController.checkAnagram(answerDisplayWord,answerWord) {
                        alertText = "You guessed it right"
                        answerTally += 1 //increment correct guesses
                        (answerWord,displayWord) = myController.generateRandomWord()
                        answerDisplayWord = ""
                    } else {
                        alertText = "Wrong! try again"
                        //Hopefully this should clear it out and you can just start trying again
                        displayWord = answerDisplayWord
                        answerDisplayWord = ""
                    }
                    
                    guessWord = ""
                }
                .padding()
                
                Button("Give Up"){
                    showingAlert = true
                    
                    answerTally = 0
                    alertText = "The correct answer was \(answerWord)"
                    (answerWord,displayWord) = myController.generateRandomWord()
                    
                    
                    guessWord = ""
                }
                .padding()
                
                VStack{
                    Text("Total number correct is \(answerTally)")
                    
                    Button(action: {
                        // Code to execute when the text is clicked
                        persistentVariables.showGamePage = false
                    }
                    ) {
                        Text("Return to Main Screen")
                            .buttonsInGame()
                        
                        
                    }
                    
                    
                    
                }
                Spacer()
            }
            .padding()
            .background(Color.yellow)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Message"), message: Text(alertText), dismissButton: .default(Text("OK")))

        }
        }
        //This is all that's needed ot get app staying yellow.  Admittedly I kinda forget how this stuff works.
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        
       
    }
}

struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        GamePage()

    }
}

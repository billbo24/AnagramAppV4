//
//  WelcomePage.swift
//  AnagramAppV4
//
//  Created by William Floyd on 5/17/23.
//

import SwiftUI

struct WelcomePage: View {
    //Alright I think we do need to put this here to let it know to be on the lookout for something called persistentVariables.  Now that being said, it looks like the inheriting works without having to do the .environmentObject shit below.  
    @EnvironmentObject var persistentVariables : PersistentVariables
    var body: some View {
        
        ZStack
        {
            //It looks like color is treated more or less like an object, so if we do a Vstack or an HStack the text comes before or after.  The ZStack gets it looking like we want.  Probably could wrap everything here in a VStack
            Color.yellow.ignoresSafeArea()
                VStack{
                    
                    
                    Button(action: {
                        // Code to execute when the text is clicked
                        persistentVariables.showGamePage = true
                    }
                    ) {
                        Text("Start Game")
                            .titleScreenText()
                        
                        
                    }
                    
                    
//                    Text("Start Game")
//                        .titleScreenText() //This references a style we defined in the text style swift file
//                        .padding()
                    
                    
//                    Text("Options")
//                        .titleScreenText()
//
//
//                    Text("Credits")
//                        .titleScreenText()
                    
                    
                }
                
          
            
                
        }
        //.background(Color.yellow)
        
       
    
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}

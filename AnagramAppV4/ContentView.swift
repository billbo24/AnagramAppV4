//
//  ContentView.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/23/23.
//

import SwiftUI

struct ContentView: View {
    
    //@State var showGamePage = false
    @EnvironmentObject var persistentVariables : PersistentVariables
    
    //init() {
        //self.persistentVariables = PersistentVariables()
   // }

    
    var body: some View {
        //Gonna try a new paradigm here where he display the different views based on certain boolean variables
        if persistentVariables.showGamePage {
            GamePage()
        } else {
            WelcomePage()
        }
        
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PersistentVariables())
    }
}

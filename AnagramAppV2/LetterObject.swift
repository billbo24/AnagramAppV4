//
//  LetterObject.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/24/23.
//

import SwiftUI

struct LetterObject: View {
    //This is the object that will actually display a letter
    var letter: String //This has to be a string because we add it to letter to make the image name
    @State var imageName: String = ""
    
    var width : CGFloat
    var height : CGFloat
    
    var body: some View {
        
        //Letter size will need to be variable.  Longer words will need to be smaller.  Going to have the pixels be variable for now
        
        ZStack {
            //Lowercased just helps keep things clean.  Now even if we pass capital letters, it uses a lower cases to build the string for the image
            Image("letter_"+letter.lowercased())
                .resizable()
                .frame(width:width/2,height:height/2)
        }
        .scaledToFit()
        .frame(width:width,height:height)
        .background(.cyan)
        .cornerRadius(height) //we want circles so this works
    }
}

struct LetterObject_Previews: PreviewProvider {
    static var previews: some View {
        LetterObject(letter:"B",width: 200,height: 200)
    }
}

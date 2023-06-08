//
//  TextStyle.swift
//  AnagramAppV4
//
//  Created by William Floyd on 5/17/23.
//

import Foundation
import SwiftUI

extension Text {

    func titleScreenText() -> some View {
        self.foregroundColor(.cyan)
            .opacity(0.7)
            .font(.system(size:56.0))
            .padding()
    }

    func buttonsInGame() -> some View {
        self.foregroundColor(.cyan)
            .font(.caption)
    }
}



// Then in the app you can use it as follows


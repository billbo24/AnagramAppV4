//
//  AnagramAppV2App.swift
//  AnagramAppV2
//
//  Created by William Floyd on 2/23/23.
//

import SwiftUI

@main
struct AnagramAppV4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PersistentVariables())
        }
    }
}

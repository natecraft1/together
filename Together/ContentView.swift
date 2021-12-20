//
//  ContentView.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//

import SwiftUI
import DateHelper

struct ContentView: View {
    
    var body: some View {
        TabView {
            Story().tabItem {
                Text("Story")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

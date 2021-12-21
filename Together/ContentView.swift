//
//  ContentView.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//

import SwiftUI
import DateHelper

struct ContentView: View {
    @State var monthOfPosts: [MonthSection] = MonthSection.create(n: 12)
    @State var isAddEntrySheetPresented = false

    var body: some View {
        TabView {
            NavigationView {
                Story(monthOfPosts: monthOfPosts).tabItem {
                    Text("Story")
                }.sheet(isPresented: $isAddEntrySheetPresented, onDismiss: nil, content: {
                    AddEntryView()
                }).navigationBarTitle("Glass Family")
                    .navigationBarItems(trailing: Button(action: {
                        isAddEntrySheetPresented = true
                    }) {
                        Text("Add Entry")
                    })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

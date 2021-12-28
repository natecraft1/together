//
//  ContentView.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//

import Models
import SwiftUI
import DateHelper

struct ContentView: View {
    @State var monthOfPosts: [MonthSection] = MonthSection.create(n: 20)
    @State var isAddEntrySheetPresented = false

    var body: some View {
        TabView {
            NavigationView {
                Story(monthOfPosts: monthOfPosts).sheet(isPresented: $isAddEntrySheetPresented, onDismiss: nil, content: {
                    AddEntryView()
                }).navigationBarTitle("Glass Family")
                .navigationBarItems(trailing: Button(action: {
                    isAddEntrySheetPresented = true
                }) {
                    Text("Add").foregroundColor(Color.purple)
                })
            }.navigationViewStyle(.stack)
                .tabItem {
                Label("Story", systemImage: "book")
            }
           
            
            NavigationView {
                FeedView()
                    .navigationBarTitle("Feed")
            }.navigationViewStyle(.stack)
            .tabItem {
                Label("Feed", systemImage: "person.2.fill")
            }
            
            NavigationView {
                InvitesView()
                    .navigationBarTitle("Pending Invites")
                    .navigationBarItems(trailing: Button(action: {}) {
                        Text("Invite")
                    })
            }.navigationViewStyle(.stack)
                .tabItem {
                Label("Invites", systemImage: "mail")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

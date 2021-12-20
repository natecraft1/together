//
//  ContentView.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//

import SwiftUI
import DateHelper

struct ContentView: View {
    @State var monthOfPosts: [MonthSection] = MonthSection.create(n: 10)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(monthOfPosts) { month in
                    MonthSectionView(month: month.monthAbbreviation)
                    ForEach(month.days) { day in
                        HStack {
                            DaySectionView(day: day.dayAbbreviation).frame(width: .infinity, height: nil)
                                .padding(.leading, 15)
                            Spacer()
                        }
                        ForEach(day.posts) { post in
                            PostView(post: post).frame(height: 100)
                        }
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

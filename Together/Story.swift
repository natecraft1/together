//
//  Story.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI

struct Story: View {
    @State var monthOfPosts: [MonthSection] = MonthSection.create(n: 10)

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(monthOfPosts) { month in
                    MonthSectionView(month: month.monthAbbreviation)
                    ForEach(month.days) { day in
                        HStack {
                            DaySectionView(day: day.dayAbbreviation)
                                .padding(.leading, 16)
                            Spacer()
                        }
                        ForEach(day.posts) { post in
                            PostView(post: post)
                                .frame(height: 100)
                        }
                    }
                }
            }
        }
    }
}

struct Story_Previews: PreviewProvider {
    static var previews: some View {
        Story()
    }
}

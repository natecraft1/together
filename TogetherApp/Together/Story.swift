//
//  Story.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI
import Models

struct Story: View {
    var monthOfPosts: [MonthSection]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(monthOfPosts) { month in
                    MonthSectionView(month: month.monthAbbreviation)
                    ForEach(month.days) { day in
                        DaySectionView(day: day.dayAbbreviation)
                            .padding(.leading, 11)
                        ForEach(day.posts) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {
                                PostView(post: post, height: post.images.isEmpty ? 120 : 180)
                                    .frame(height: post.images.isEmpty ? 120 : 180)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct Story_Previews: PreviewProvider {
    static var previews: some View {
        Story(monthOfPosts: MonthSection.create(n: 10))
    }
}

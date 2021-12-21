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
                        DaySectionView(day: day.dayAbbreviation)
                            .padding(.leading, 16)
                        ForEach(day.posts) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {                            
                                PostView(post: post, height: post.images.isEmpty ? 100 : 150)
                                    .frame(height: post.images.isEmpty ? 100 : 150)
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
        Story()
    }
}

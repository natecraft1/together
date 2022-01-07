//
//  FeedView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import Models
import PostBody
import SwiftUI

struct CoupleView: View {
    var name: String
    var body: some View {
        HStack {
            IconView()
                .offset(x: 0, y: -2)
                .padding(.trailing, 4)
            Text(name)
                .font(.system(size: 19))
                .foregroundColor(Color.black.opacity(0.8))
                .padding(.bottom, 6)
            Spacer()
        }
    }
}

struct FeedView: View {
    @State var feedItems = FeedPost.createModels()
    @State var monthOfPosts: [MonthSection] = MonthSection.create(n: 12)
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(feedItems) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(
                            destination:
                                Story(monthOfPosts: monthOfPosts)
                                .navigationBarTitle(item.author))
                            {
                                CoupleView(name: item.author)
                            }
                        PostBodyView(
                            date: item.date,
                            title: item.title,
                            text: item.text,
                            images: Array(item.images.prefix(item.text == nil ? 4 : 2))
//                            height: item.images.isEmpty ? 180 : 240
                        )
                    }
//                    .frame(height: item.images.isEmpty ? 180 : 240)
                    Divider()
                }
            }
        }.padding()
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

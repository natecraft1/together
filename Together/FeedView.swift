//
//  FeedView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import SwiftUI

struct FeedView: View {
    @State var feedItems = FeedPost.createModels()
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(feedItems) { item in
                    VStack(alignment: .leading) {
                        HStack {
                            IconView()
                                .offset(x: 0, y: -2)
                                .padding(.trailing, 4)
                            Text(item.author)
                                .font(.system(size: 19))
                                .foregroundColor(Color.black.opacity(0.8))
                                .padding(.bottom, 6)
                            Spacer()
                        }
                        PostBodyView(
                            date: item.date,
                            title: item.title,
                            text: item.text,
                            images: Array(item.images.prefix(item.text == nil ? 4 : 2)),
                            height: item.images.isEmpty ? 180 : 240
                        )
                    }
                    .frame(height: item.images.isEmpty ? 180 : 240)
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

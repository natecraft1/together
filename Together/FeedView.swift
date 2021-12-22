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
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(feedItems) { item in
                    PostBodyView(date: item.date, title: item.title, text: item.text, images: item.images)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

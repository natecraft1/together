//
//  PostView.swift
//  Together
//
//  Created by Nathan Glass on 12/18/21.
//

import SwiftUI
import DateHelper

struct PostView: View {
    var post: Post
    var height: CGFloat
    private let images: [String]
    init(
        post: Post,
        height: CGFloat
    ) {
        self.post = post
        self.height = height
        let minImages = post.text == nil ? min(post.images.count, 3) : 0
        let maxImages = post.text != nil ? min(2, post.images.count) : min(4, post.images.count)
        self.images = Array(post.images
            .prefix(Int.random(in: minImages...maxImages)))
    }

    var body: some View {
        HStack {
            Rectangle()
                .size(width: 1, height: height)
                .fill(Color.purple.opacity(0.4))
                .padding(.leading, 26)
                .padding(.trailing, 0)
                .frame(width: 30, height: height)
            Spacer().frame(width: 20, height: nil, alignment: .center)
            PostBodyView(date: post.date, title: post.title, text: post.text, images: images, height: height)
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.createModels(n: 1).first!, height: 180).previewLayout(.sizeThatFits)
    }
}

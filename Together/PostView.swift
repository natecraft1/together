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
                .padding(.leading, 30)
                .padding(.trailing, 0)
                .frame(width: 30, height: height)
            Spacer().frame(width: 20, height: nil, alignment: .center)
            VStack(alignment: .leading) {
                HStack {
                    if let title = post.title {
                        Text(title)
                            .fontWeight(Font.Weight.semibold)
                            .font(.system(size: 16))
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.leading, 3)
                    }
                    Spacer()
                    Text(post.date.toString(format: .custom("hh:mm a")))
                        .font(.system(size: 10))
                        .foregroundColor(Color.gray.opacity(0.8))
                }
                HStack(alignment: .top) {
                    if let text = post.text {
                        Text(text)
                            .font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.9))
                            .fixedSize(
                                horizontal: false,
                                vertical: true)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 5)
                            
                    }
                    ForEach(Array(zip(images.indices, images)).prefix(post.text == nil ? Int.max : 2), id: \.0) { index, image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: nil, height: 80, alignment: .center)
                            .cornerRadius(6)
                            .offset(x: CGFloat(-10 * index), y: 3 * (index % 2 == 0 ? -1 : 1))
                    }
                   
                }.padding(.bottom, 10)
                HStack {
                    Spacer()
                    Text("Comments (\(Int.random(in: 1..<7)))")
                        .font(.system(size: 11))
                        .foregroundColor(Color.blue.opacity(0.65))
                        .offset(x: 0, y: -3)
                }
            }
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.createModels(n: 1).first!, height: 150).previewLayout(.sizeThatFits)
    }
}

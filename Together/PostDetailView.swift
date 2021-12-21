//
//  PostDetailView.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post
    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .bottom) {
                    Spacer()
                    Text(post.date.toString(format: .custom("MM/YY")))
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray.opacity(0.8))
                }
                LazyVGrid(columns: gridItemLayout, spacing: 8) {
                    ForEach(Array(zip(post.images.indices, post.images)).prefix(post.text == nil ? Int.max : 2), id: \.0) { index, image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: nil, height: CGFloat.random(in: 110...190), alignment: .center)
                    }
                }
                if let text = post.text {
                    Text(text)
                        .font(.system(size: 13))
                        .foregroundColor(Color.black.opacity(0.9))
                        .lineLimit(nil)
                }
                Divider()
                HStack {
                    Spacer()
                    Text("Comments (\(Int.random(in: 1..<7)))")
                        .font(.system(size: 11))
                        .foregroundColor(Color.blue.opacity(0.65))
                }
                CommentView(person: "Dwight Schrute", comment: "Wow, this looks amazing!")
                    .padding(.bottom, 15)
                CommentView(person: "Andy Bernard", comment: "Where was this??")
                    .padding(.bottom, 15)
                CommentView(person: "Phyllis Vance", comment: "Love it!")
                    .padding(.bottom, 15)
            }.padding()
                .navigationBarTitle(post.title ?? "")
        }
        
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post.createModels(n: 1).first!)
    }
}

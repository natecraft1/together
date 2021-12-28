//
//  PostDetailView.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI
import Models

struct PostDetailView: View {
    var post: Post
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if let title = post.title, !title.isEmpty {
                PostDetailMainView(post: post)
                    .navigationBarTitle(title)
            } else {
                PostDetailMainView(post: post)
            }
        }
        
    }
}

struct PostDetailMainView: View {
    var post: Post

    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
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
                    .padding(.top, 10)
            }
            Divider().padding(.vertical, 10)
            HStack {
                Spacer()
                Text("Comments (\(Int.random(in: 1..<7)))")
                    .font(.system(size: 11))
                    .foregroundColor(Color.purple.opacity(0.7))
            }
            CommentView(person: "Michael Scott", comment: "Why are you the way that you are?")
                .padding(.bottom, 15)
            CommentView(person: "Dwight Schrute", comment: "Wow, this looks amazing!")
                .padding(.bottom, 15)
            CommentView(person: "Andy Bernard", comment: "Where was this??")
                .padding(.bottom, 15)
            CommentView(person: "Phyllis Vance", comment: "Love it!")
                .padding(.bottom, 15)
                .padding(.bottom, 15)
        }.padding()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post.createModels(n: 1).first!)
    }
}

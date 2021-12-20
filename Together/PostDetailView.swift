//
//  PostDetailView.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
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
                
                ForEach(Array(zip(post.images.indices, post.images)).prefix(post.text == nil ? Int.max : 2), id: \.0) { index, image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: nil, height: 110, alignment: .center)
                        .cornerRadius(6)
                        .offset(x: CGFloat(-10 * index), y: 3 * (index % 2 == 0 ? -1 : 1))
                }
                if let text = post.text {
                    Text(text)
                        .font(.system(size: 13))
                        .foregroundColor(Color.black.opacity(0.9))
                        .lineLimit(nil)
                }
                HStack {
                    Spacer()
                    Text("Comments (\(Int.random(in: 1..<7)))")
                        .font(.system(size: 11))
                        .foregroundColor(Color.blue.opacity(0.65))
                }
            }
        }
        
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post.createModels(n: 1).first!)
    }
}

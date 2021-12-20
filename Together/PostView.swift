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
    var body: some View {
        HStack {
            Rectangle()
                .size(width: 1, height: 120)
                .fill(Color.purple.opacity(0.4))
                .padding(.leading, 30)
                .padding(.trailing, 0)
                .frame(width: 30, height: 120)
            Spacer().frame(width: 20, height: nil, alignment: .center)
            VStack(alignment: .leading) {
                Text(post.title)
                    .padding(.leading, 3)
                HStack {
                    ForEach(Array(zip(post.images.indices, post.images)), id: \.0) { index, image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: nil, height: 80, alignment: .center)
                            .cornerRadius(6)
                            .offset(x: CGFloat(-10 * index), y: 3 * (index % 2 == 0 ? -1 : 1))
                    }
                }
            }
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.createModels(n: 1).first!).previewLayout(.sizeThatFits)
    }
}

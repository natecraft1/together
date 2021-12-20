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
                .size(width: 1, height: 100)
                .fill(Color.red)
                .padding(.leading, 30)
                .ignoresSafeArea(.all)
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(post: Post.createModels(n: 1).first!).previewLayout(.sizeThatFits)
//    }
//}

//
//  CommentView.swift
//  Together
//
//  Created by Nathan Glass on 12/20/21.
//

import SwiftUI

struct CommentView: View {
    var person: String
    var comment: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(person)
                .font(.system(size: 12))
                .fontWeight(.bold)
            +
            Text("  ")
            +
            Text(comment)
                .font(.system(size: 12))
            Text("1 day ago")
                .font(.system(size: 12))
                .foregroundColor(Color.black.opacity(0.7))
            + Text("   ")
            + Text("Reply")
                .font(.system(size: 12))
                .foregroundColor(Color.black.opacity(0.8))
                .fontWeight(.semibold)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(person: "Dwight Schrute", comment: "Wow, looks amazing!")
    }
}

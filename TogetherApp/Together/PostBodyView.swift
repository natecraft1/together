//
//  PostBodyView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import SwiftUI

struct PostBodyView: View {
    var date: Date
    var title: String?
    var text: String?
    var images: [String]
    var height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let title = title {
                    Text(title)
                        .fontWeight(Font.Weight.medium)
                        .font(.system(size: 18))
                        .foregroundColor(Color.black.opacity(0.9))
                        .padding(.leading, 3)
                }
                Text(date.toString(format: .custom("h:mm a")))
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray.opacity(0.9))
                Spacer()
            }
            HStack {
                if let text = text {
                    Text(text)
                        .font(.system(size: 13))
                        .foregroundColor(Color.black.opacity(0.9))
                        .fixedSize(
                            horizontal: false,
                            vertical: true)
                        .multilineTextAlignment(.leading)
                        .lineLimit(9)
                        .padding(.top, 5)
                        .padding(.trailing, 4)
                        
                }
                ForEach(Array(zip(images.indices, images)), id: \.0) { index, image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: nil, height: text == nil ? 105 : 90, alignment: .center)
                        .cornerRadius(6)
                        .offset(x: CGFloat(-10 * index), y: (text == nil ? 3 : 5) * (index % 2 == 0 ? -1 : 1))
                }
               
            }.padding(.bottom, 10)
            HStack {
                Spacer()
                Text("Comments (\(Int.random(in: 1..<7)))")
                    .font(.system(size: 11))
                    .foregroundColor(Color.purple.opacity(0.7))
                    .offset(x: -8, y: -4)
            }
        }
    }
}

struct PostBodyView_Previews: PreviewProvider {
    static var previews: some View {
        PostBodyView(date: Date(), title: "Hello world", text: "lorem ipsum", images: ["1", "2", "3"], height: 180)
    }
}

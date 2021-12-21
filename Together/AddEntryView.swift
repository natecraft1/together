//
//  AddEntryView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import SwiftUI

struct AddEntryView: View {
    @State var title = ""
    @State var text = ""
    var body: some View {
        
        VStack(alignment: .leading) {
            TextField("Entry Title (Optional)", text: $title)
            Divider()
            TextField("Text (Optional)", text: $text).padding(.top, 10)
            Spacer().frame(width: nil, height: 100)
            Divider()
            Text("Add Media")
                .font(.system(size: 13))
                .foregroundColor(Color.black.opacity(0.8))
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], alignment: .leading, spacing: 4) {
                    ForEach((1...14).map(String.init), id: \.self) { imageString in
                        Image(imageString)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 69, height: 69, alignment: .center)
                            .clipped()
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
    }
}

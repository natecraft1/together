//
//  AddEntryView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import SwiftUI

struct ImageModel: Identifiable {
    let id = UUID()
    var n: Int
    var isSelected: Bool = false
}

struct AddEntryView: View {
    @State var title = ""
    @State var text = ""
    @State var imageModels: [ImageModel] = (1...35).map { ImageModel(n: $0) }
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Entry Title (Optional)", text: $title)
                Divider()
                TextField("Text (Optional)", text: $text).padding(.top, 10)
                Spacer().frame(width: nil, height: 120)
                Divider()
                Text("Add Media")
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.8))
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], alignment: .leading, spacing: 4) {
                        ForEach(imageModels) { model in
                            ZStack(alignment: .bottomTrailing) {
                                Image(String((model.n % 14) + 1))
                                    .resizable()
                                    .scaleEffect(model.isSelected ? 1.04 : 1)
                                    .scaledToFill()
                                    .frame(width: 69, height: 69, alignment: .center)
                                    .clipped()
                                    .onTapGesture {
                                        withAnimation(Animation.easeIn(duration: 0.1)) {
                                            imageModels[model.n - 1].isSelected = !model.isSelected
                                        }
                                    }
                                    Circle().fill(Color.green).frame(width: 16, height: 16, alignment: .center)
                                        .padding(.trailing, 3)
                                        .padding(.bottom, 3)
                                        .scaleEffect(model.isSelected ? 1 : 0.7)
                                        .opacity(model.isSelected ? 1 : 0)
                                    
                                
                            }
                        }
                    }
                }
                Spacer()
            }.padding(.horizontal)
                .navigationBarTitle("New Entry")
                
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                },
                    trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                })
        }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
    }
}

//
//  DaySectionView.swift
//  Together
//
//  Created by Nathan Glass on 12/19/21.
//

import SwiftUI

struct DaySectionView: View {
    var day: String
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(Color.red, lineWidth: 1)
//                    .padding(6)
                Text(day)
                    .font(.system(size: 12))
//                    .padding(10)
            }.frame(width: 30, height: 30, alignment: .center)
            Spacer()
        }
    }
}

struct DaySectionView_Previews: PreviewProvider {
    static var previews: some View {
        DaySectionView(day: "21").previewLayout(.sizeThatFits)
    }
}

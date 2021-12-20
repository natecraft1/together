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
                    .stroke(Color.purple.opacity(0.6), lineWidth: 1)
                Text(day)
                    .font(.system(size: 12))
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
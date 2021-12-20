//
//  MonthSectionView.swift
//  Together
//
//  Created by Nathan Glass on 12/19/21.
//

import SwiftUI

struct MonthSectionView: View {
    var month: String
    var body: some View {
        VStack {
            HStack {
                Text(month)
                    .padding(.leading, 15)
                    .padding(.top, 5)
                Spacer()
            }
//            Rectangle()
//                .size(width: 1, height: 10)
//                .fill(Color.red)
//                .padding(.leading, 30)
//                .edgesIgnoringSafeArea(.bottom)
        }
        Spacer()
    }
}

struct MonthSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MonthSectionView(month: "Nov").previewLayout(.sizeThatFits)
    }
}

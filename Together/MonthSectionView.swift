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
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.6))
                    .padding(.leading, 18)
                    .padding(.top, 5)
                Spacer()
            }
            Rectangle()
                .size(width: 1, height: 10)
                .fill(Color.purple.opacity(0.4))
                .padding(.leading, 30)
        }
        
    }
}

struct MonthSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MonthSectionView(month: "Nov").previewLayout(.sizeThatFits)
    }
}

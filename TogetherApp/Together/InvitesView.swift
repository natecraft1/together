//
//  InvitesView.swift
//  Together
//
//  Created by Nathan Glass on 12/21/21.
//

import Models
import SwiftUI
import DateHelper

struct InvitesView: View {
    @State var invites: [Invite] = Invite.create()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(invites) { invite in
                    HStack
                    {
                        VStack(alignment: .leading) {
                            Text(invite.name)
                                .fontWeight(Font.Weight.medium)
                                .font(.system(size: 17))
                                .foregroundColor(Color.black.opacity(0.9))
                            Text("Sent \(invite.relativeTime)")
                                .foregroundColor(Color.gray.opacity(0.7))
                                .font(.system(size: 12))
                        }
                        Spacer()
                        Button(action: {
                            if let index = self.invites.firstIndex(of: invite) {
                                withAnimation {
                                    self.invites.remove(at: index)
                                }
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(Color.blue)
                                    .frame(width: 80, height: 30)
                                Text("Follow").foregroundColor(Color.white)
                            }
                        }
                    }.padding()
                    Divider()
                }
            }
        }.padding()
    }
}

struct InvitesView_Previews: PreviewProvider {
    static var previews: some View {
        InvitesView(invites: Invite.create(n: 4))
    }
}

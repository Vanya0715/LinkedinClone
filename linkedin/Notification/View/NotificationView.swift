//
//  NotificationView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 26/07/22.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(spacing: 20) {
            SearchBar()
            List {
                notificationDetails(image: "applelogo", data: "Apple's car project is at the center of a guilty verdict over stolen trade secrets.")
                
                notificationDetails(image: "applelogo", data: "Apple employees aren't ready to give up remote work.")
            }.listStyle(.inset)
        }
            .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct notificationDetails: View {
    
    @State var image: String
    @State var data: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .leading)
            VStack(alignment: .leading) {
                Text(data)
                    .fixedSize(horizontal: false, vertical: true)

                Button {
                    
                } label: {
                    Text("View Details")
                        .foregroundColor(.cyan)
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.cyan, lineWidth: 2))
                }
            }
        }
    }
}

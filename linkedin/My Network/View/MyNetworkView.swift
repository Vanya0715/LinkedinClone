//
//  MyNetworkScreen.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 25/07/22.
//

import SwiftUI

struct MyNetworkScreen: View {
    var body: some View {
        VStack{
            
                SearchBar()
                
                HStack {
                    Text("Manage my network")
                        .font(.body)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(.gray)
                }.padding(.horizontal)
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: .infinity, height: 8)
                    .ignoresSafeArea(.all)

                
            ScrollView(.vertical,showsIndicators: false) {
                HStack {
                    Text("Invitations")
                        .font(.body)
                        .foregroundColor(.blue)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }.padding(.horizontal)
                    
                    Divider()
                    
                    ForEach(mockData, id: \.id){ data in
                        InvitationView(Data: data)
                        Divider()
                    }
            }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct MyNetworkScreen_Previews: PreviewProvider {
    static var previews: some View {
        MyNetworkScreen()
    }
}

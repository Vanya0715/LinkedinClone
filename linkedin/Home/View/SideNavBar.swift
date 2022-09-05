//
//  sideBar.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 22/07/22.
//

import SwiftUI

struct MenuContent: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            HStack {
                Image(systemName: "person.circle")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.white)
                Text("Your Profile")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
            }
            .padding(.leading, 8)
            .padding(.vertical)
            Divider()
              .frame(width: 220, height: 2)
              .background(Color.white)
              .padding(.horizontal, 16)


        VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("First Name: \(sessionService.userDetails?.firstName ?? " N/A")")
                    Text("Last Name: \(sessionService.userDetails?.lastName ?? " N/A")")
                    Text("Occupasion: \(sessionService.userDetails?.occupation ?? " N/A")")
                }
                .padding(.leading, 8)
                Spacer()
                Button {
                    sessionService.logout()
                } label: {
                    Text("Logout")
                        .frame(maxWidth: 200, maxHeight: 40)
                        .background(.cyan)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .cornerRadius(18)
                        .overlay(RoundedRectangle(cornerRadius: 18)
                                    .stroke(.white, lineWidth: 2)
                    )
                        .padding(.horizontal, 16)
                }
               
                Spacer()
            }
        .padding(.vertical)
            
        }
       
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct sideNavBar: View {
  
        let width: CGFloat
        let isOpen: Bool
        let menuClose: () -> Void
        
        var body: some View {
            ZStack{
                GeometryReader { _ in
                    EmptyView()
                }
                .background(Color.gray.opacity(0.3))
                .opacity(self.isOpen ? 1.0 : 0.0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    self.menuClose()
                }
                HStack {
                    MenuContent().environmentObject(SessionServiceImpl())
                        .frame(width: self.width)
                        .background(Color.black.opacity(isOpen ? 0.9 : 0))
                        .offset(x: self.isOpen ? 0 : -self.width)
                        .animation(.default)

                    Spacer()
                                    
                            }
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
}


//
//  HomeScreen.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 14/07/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State private var showMenu: Bool = false
    
    var body: some View {
     
            ZStack {
                VStack {
                    if !self.showMenu {
                         Button(action: {
                             self.openMenu()
                         }, label: {
                             HStack{
                             Image(systemName: "text.justify")
                                     .font(.system(size: 15, weight: .bold))
                                     .foregroundColor(.gray)
                                     .padding(.leading,15)
                             Logo()
                             }
                         })
                    }
                    ProfileAndPostView()
                       
                    MainPost()
                       
                }
                
                sideNavBar(width: 270,
                         isOpen: self.showMenu,
                         menuClose: self.openMenu)
            }
            .padding(.vertical)
            .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        

    }
    func openMenu() {
           self.showMenu.toggle()
       }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(SessionServiceImpl())
    }
}

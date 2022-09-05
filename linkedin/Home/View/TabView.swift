//
//  TabView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 22/07/22.
//

import SwiftUI

struct TabScreen: View {
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill").foregroundColor(.cyan)
                    Text("Home").foregroundColor(.cyan)
                }
            MyNetworkScreen()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("My Network")
                }
          OptionsView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Post")
                }
           NotificationView()
                .tabItem {
                    Image(systemName: "bell.badge.fill")
                    Text("Notifications")
                }
           JobsView()
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Jobs")
                }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}


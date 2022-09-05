//
//  linkedinApp.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 12/07/22.
//

import SwiftUI
import Firebase

@main
struct linkedinApp: App {
    
    @StateObject var sessionService = SessionServiceImpl()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           
                switch sessionService.state {
                case.loggedIn:
                    TabScreen()
                        .environmentObject(sessionService)
                case .loggedOut:
                    ContentView()
                }
           
        }
    }
  
   }


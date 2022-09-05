//
//  ContentView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 12/07/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        NavigationView{
        LaunchScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen().environmentObject(SessionServiceImpl())
    }
}

//
//  LaunchScreen.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 12/07/22.
//

import SwiftUI

struct LaunchScreen: View {
    
    var image = ["0","1","2"]
    @State var showLogin = false
    @State var showJoinNow = false
    
    //MARK: - Launch screen view
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
             Logo()
                .padding()
          
                imageScrollView()
                    .frame(width: 365, height: 380, alignment: .center)
                    .padding()
            
                
                Image("")
                VStack(spacing: 30) {

                    VStack {
                        ButtonView(title: "Join Now") {
                            self.showJoinNow.toggle()
                        }
                        .sheet(isPresented: $showJoinNow) {
                            JoinScreen()
                        }
                       
                        ButtonView(title: "Login", background: .clear, foreground: .cyan, border: .cyan) {
                            self.showLogin.toggle()
                        }
                        .sheet(isPresented: $showLogin) {
                            LoginScreen()
                        }
                       
                    }
                }.padding()
             
            }
        }.navigationBarHidden(true)
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

//MARK: - animation for images on Launch screen

struct imageScrollView: View {
    
    private var numberOfImages = 4
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var current = 0
    
    var body: some View {
        VStack {
            TabView(selection: $current) {
                ForEach(0..<numberOfImages) { num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFill()
                        .padding()
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
                .frame(width: 365, height: 380, alignment: .center)
                .onReceive(timer, perform: { _ in
                    withAnimation {
                        current = current < numberOfImages ? current + 1 : 0
                    }
                   
                })
        }
    }
}

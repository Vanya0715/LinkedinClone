//
//  profileAndPostView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 22/07/22.
//

import Foundation
import SwiftUI

struct ProfileAndPostView: View {
    
    @State var addPhoto = false
    @State var addVideo = false
    @State var addEvent = false
    
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            
            HStack(alignment: .center) {
                Image(systemName: "square.and.pencil")
                Text("Start a post")
            }.padding(.leading, 10)
           
            Divider()
            
            HStack(alignment:.center, spacing: 50) {
                Button {
                    self.addPhoto.toggle()
                } label: {
                    Image(systemName: "photo").foregroundColor(.blue)
                    Text("Photo")
                }.sheet(isPresented: $addPhoto) {
                  Post()
                }
               

                Button {
                    self.addVideo.toggle()
                } label: {
                    Image(systemName: "video.fill").foregroundColor(.green)
                    Text("Video")
                }.sheet(isPresented: $addVideo) {
                    Video()
                }
            
                Button {
                    self.addEvent.toggle()
                } label: {
                    Image(systemName: "calendar").foregroundColor(.orange)
                    Text("Event")
                }
                .sheet(isPresented: $addEvent) {
                    Event(eventFormat: "", eventName: "", dateAndTime: "", eventDescription: "")
                }
             
                
            }.padding(.leading, 10)
        }
    }
}

struct ProfileAndPostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAndPostView()
    }
}

//
//  OptionsView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 29/07/22.
//

import SwiftUI

struct OptionsView: View {
    @State var addPhoto = false
    @State var addVideo = false
    @State var addOcassion = false
    @State var addDocument = false
    @State var addEvent = false
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 60, weight: .light))
                    .foregroundColor(.black.opacity(0.6))
                    
                VStack(alignment: .leading, spacing: 8){
                    
                Text("\(sessionService.userDetails?.firstName ?? " N/A")")
                        .font(.title2)
                RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 1)
                    
                    .overlay(
                        HStack {
                            Image(systemName: "globe.americas.fill")
                            Text("Anyone")
                                .font(.system(size: 15))
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.system(size: 10))
                        } .foregroundColor(.black.opacity(0.6))
                    )
                    
                    .frame(width: 120, height: 25, alignment: .leading)
                }.frame(width: 200, height: 70, alignment: .leading)
            }
            .padding()
            .frame(width: 230, height: 70, alignment: .leading)
            Divider()
            Text("What do you want to talk about?")
                .foregroundColor(.black.opacity(0.6))
                .padding()
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
          RoundedRectangle(cornerRadius: 15)
                    .frame(width: 50, height: 8, alignment: .center)
                    .offset(x: 150, y: -20)
                Options(Image: "photo", option: "Add a photo") {
                    self.addPhoto.toggle()
                }
                .sheet(isPresented: $addPhoto) {
                  Post()
                }
                Options(Image: "video.fill", option: "Take a video") {
                    self.addVideo.toggle()
                }
                .sheet(isPresented: $addVideo) {
                    Video()
                }
                Options(Image: "checkmark.seal", option: "Celebrate an occasion") {
                    self.addOcassion.toggle()
                }
                .sheet(isPresented: $addOcassion) {
                    Ocassion()
                }
                Options(Image: "doc.badge.plus", option: "Add a document"){
                    self.addDocument.toggle()
                }
                .sheet(isPresented: $addDocument) {
                    UploadDocument()
                }
                Options(Image: "calendar", option: "Create an event"){
                    self.addEvent.toggle()
                }
                .sheet(isPresented: $addEvent) {
                    Event(eventFormat: "", eventName: "", dateAndTime: "", eventDescription: "")
                }
            }.padding()
            .frame(width: 389, height: 300, alignment: .leading)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 2, y: -5)
            .ignoresSafeArea(.all)
               
               
        }
        .background(.ultraThinMaterial)
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView().environmentObject(SessionServiceImpl())
    }
}


struct Options: View {
    @State var Image: String
    @State var option: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 15) {
                SwiftUI.Image(systemName: "\(Image)")
                Text(option)
                    .font(.system(size: 18, weight: .medium, design: .serif))
            }.foregroundColor(.black.opacity(0.6))
        }
    }
}

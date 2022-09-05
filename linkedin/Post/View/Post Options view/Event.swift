//
//  Event.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 29/07/22.
//

import SwiftUI

struct Event: View {
    
    @State var eventFormat: String
    @State var eventName: String
    @State var dateAndTime: String
    @State var eventDescription: String
    @State var isOnline: Bool = false
    @State var isInPerson: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
          Logo()
            VStack(alignment: .leading, spacing: 10){
                Text("Event type")
                HStack {
                    Image(systemName: isOnline ? "circle.circle" : "circle").foregroundColor(isOnline ? .green : .gray)
                    Text("Online").foregroundColor(isOnline ? .black : .gray)
                        
                }.onTapGesture {
                    self.isOnline.toggle()
                    self.isInPerson = false
                }
                HStack{
                    Image(systemName: isInPerson ? "circle.circle" : "circle").foregroundColor(isInPerson ? .green : .gray)
    
                    Text("In person").foregroundColor(isInPerson ? .black : .gray)
                       
                       
                }
                .onTapGesture {
                    self.isInPerson.toggle()
                    self.isOnline = false
                }
            }
       
            VStack(alignment: .leading) {
                Text("Event format *")
                InputTextFields(text: $eventFormat, placeholder: "Format", keyboardtype: .default, sfSymbol: nil)
                
                Text("Event name *")
                InputTextFields(text: $eventName, placeholder: "Name", keyboardtype: .default, sfSymbol: nil)
                
                Text("Date and Time *")
                InputTextFields(text: $dateAndTime, placeholder: "Date and time ", keyboardtype: .default, sfSymbol: nil)
                
                Text("Description")
                InputTextFields(text: $eventDescription, placeholder: "Description", keyboardtype: .default, sfSymbol: nil)
            }
            ButtonView(title: "Done") {
            
            }
Spacer()
        }
        .navigationBarHidden(true)
        .padding()
  
        
    }
}

struct Event_Previews: PreviewProvider {
    static var previews: some View {
        Event(eventFormat: "", eventName: "", dateAndTime: "", eventDescription: "")
    }
}

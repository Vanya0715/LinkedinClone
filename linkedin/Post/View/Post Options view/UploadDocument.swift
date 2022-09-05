//
//  UploadDocument.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 29/07/22.
//

import SwiftUI

struct UploadDocument: View {
    
    @State private var description: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Logo()
                .padding()
            TextField("Add a descriptive title to your document", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 15, weight: .regular, design: .serif))
    
            Text("Adding a title helps your document get discovered more easily")
                .foregroundColor(.gray)
                .font(.system(size: 15, weight: .light, design: .serif))
            Spacer()
            ButtonView(title: "Choose a file", background: .clear, foreground: .cyan, border: .cyan) {
            }
            Spacer()
        }.padding()
    }
}

struct UploadDocument_Previews: PreviewProvider {
    static var previews: some View {
        UploadDocument()
    }
}

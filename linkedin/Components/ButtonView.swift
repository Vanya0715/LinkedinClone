//
//  ButtonView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 13/07/22.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    private let cornerRadius: CGFloat = 18
    
    internal init(title: String, background: Color = .cyan, foreground: Color = .white, border: Color = .clear, handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    var body: some View {
        Button (action: handler) {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
       
        }.background(background)
            .foregroundColor(foreground)
            .font(.system(size: 20, weight: .bold, design: .serif))
            .cornerRadius(cornerRadius)
        
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(border, lineWidth: 2)
                       
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(title: "Primary") { }
            .preview(with: "Primary")
            ButtonView(title: "Secondary",
                       background: .clear,
                       foreground: .cyan,
                       border: .cyan) { }
            .preview(with: "Secondayr")
        }
       
    }
}

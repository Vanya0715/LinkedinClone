//
//  TextFields.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 13/07/22.
//

import SwiftUI

struct InputTextFields: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardtype: UIKeyboardType
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity, maxHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
            .keyboardType(keyboardtype)
            .background(
                ZStack(alignment: .leading){
                    if let systemImage = sfSymbol{
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(.gray.opacity(0.3))
                }
            
            )
           
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        InputTextFields(text: .constant(""), placeholder: "Email", keyboardtype: .emailAddress, sfSymbol: "envelope")
                .preview(with: "Email Text")
            
        InputTextFields(text: .constant(""), placeholder: "First Name", keyboardtype: .default, sfSymbol: nil)
                .preview(with: "First Name text")
        }
    }
}

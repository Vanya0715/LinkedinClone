//
//  PasswordTextField.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 13/07/22.
//

import SwiftUI

struct PasswordTextField: View {
    
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity, maxHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
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

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PasswordTextField(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
            .preview(with: "Password Text")
            
            PasswordTextField(password: .constant(""), placeholder: "Password", sfSymbol: nil)
            .preview(with: "Password Text")
        }
      
        
    }
}

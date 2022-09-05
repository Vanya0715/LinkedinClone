//
//  ForgotPasswordView.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 13/07/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = ForgotPasswordViewModelImpl(
        service: ForgotPasswordServiceImpl()
    )
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Logo()
                    .padding(.horizontal)
                Button {
                    
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    
                    Image(systemName: "multiply")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding()
                }
                
            }.padding(.bottom, 30)
            InputTextFields(text: .constant(""), placeholder: "Email", keyboardtype: .emailAddress, sfSymbol: "envelope")
            Text("* press the button to send password reset link")
                .frame(width:360, height: 14, alignment: .leading)
                .padding(.horizontal)
                .font(.system(size: 12, weight: .light))
            ButtonView(title: "Send") {
                viewModel.sendPasswordResetRequest()
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

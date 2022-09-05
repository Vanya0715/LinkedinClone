//
//  JoinScreen.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 12/07/22.
//

import SwiftUI

struct JoinScreen: View {
    
// MARK: -
    
    @StateObject private var viewModel = RegistrationViewModelImpl(
           service: RegistrationServiceImpl()
       )
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
// MARK: -
        VStack(spacing: 20) {
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
            
// MARK: -
            VStack(spacing: 16) {
                InputTextFields(text: $viewModel.newUser.firstName,
                            placeholder: "First Name",
                            keyboardtype: .namePhonePad,
                            sfSymbol: nil)
            
                InputTextFields(text: $viewModel.newUser.lastName,
                            placeholder: "Last Name",
                            keyboardtype: .namePhonePad,
                            sfSymbol: nil)
            
                InputTextFields(text: $viewModel.newUser.occupation,
                            placeholder: "Occupation",
                            keyboardtype: .namePhonePad,
                            sfSymbol: nil)
                Divider()
            
                InputTextFields(text: $viewModel.newUser.email,
                            placeholder: "Email",
                            keyboardtype: .emailAddress,
                            sfSymbol: "envelope")
            
                PasswordTextField(password: $viewModel.newUser.password,
                              placeholder: "Password",
                              sfSymbol: "lock")
            }
            
// MARK: -
            VStack {
                ButtonView(title: "Join") {
                    viewModel.create()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            Spacer()
        }
        .padding()
            
        .alert(isPresented: $viewModel.hasError,
                   content: {
                    
                    if case .failed(let error) = viewModel.state {
                        return Alert(
                            title: Text("Error"),
                            message: Text(error.localizedDescription))
                    } else {
                        return Alert(
                            title: Text("Error"),
                            message: Text("Something went wrong"))
                    }
            })    }
}

struct JoinScreen_Previews: PreviewProvider {
    static var previews: some View {
        JoinScreen()
    }
}

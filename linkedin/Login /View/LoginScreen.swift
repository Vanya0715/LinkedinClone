//
//  LoginScreen.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 12/07/22.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State var isResetPassword = false
    @StateObject private var viewModel = LoginViewModelImpl(
        service: LoginServiceImpl()
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
           
            VStack(spacing: 16) {
                InputTextFields(text: $viewModel.credentials.email,
                                placeholder: "Email",
                                keyboardtype: .emailAddress,
                                sfSymbol: "envelope")
                PasswordTextField(password: $viewModel.credentials.password,
                                  placeholder: "Password",
                                  sfSymbol: "lock")
            }.padding()
            HStack {
                Spacer()
                Button {
                    self.isResetPassword.toggle()
                } label: {
                    Text("Forgot Password ?")
                        .foregroundColor(.cyan)
                        .font(.system(size: 16, weight: .semibold, design: .serif))
                        .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isResetPassword) {
                ForgotPasswordView()
            }
            VStack {
                ButtonView(title: "Login") {
                    viewModel.login()                }
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .padding(.vertical)
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
         })

    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
      
            LoginScreen()
        
    }
}

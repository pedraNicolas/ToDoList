//
//  LoginView.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import SwiftUI

struct LoginView: View {
    
 @StateObject var viewModel = LoginViewViewModel
    
    var body: some View {
        NavigationView() {
            VStack{
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15, 
                           background: .pink)
                // Login form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle ())
                    
                    TLButton(title: "Log In", 
                             background: .blue
                    ) {
                        // Attemp log in
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", 
                                   destination: RegisterView())
                        .padding(.bottom, 50)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

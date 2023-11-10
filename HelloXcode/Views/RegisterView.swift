//
//  RegisterView.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start organizind todo",
                       angle: -15,
                       background: .orange)
            
            // Register form
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled() 
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle ())
                
                TLButton(title: "Create Account",
                         background: .green
                ) {
                    // Attemp registration
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        } 
    }
}

#Preview {
    RegisterView()
}

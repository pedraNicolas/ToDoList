//
//  ContentView.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
    
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label(NSLocalizedString("Profile", comment: "Profile"), systemImage: "person.circle")
                }
            
        }
    }
}

#Preview {
    MainView()
}

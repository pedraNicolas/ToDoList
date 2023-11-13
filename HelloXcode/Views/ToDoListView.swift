//
//  ToDoListItemsView.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoListItem ]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos" )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List") 
            .toolbar{
                Button(action: {
                    viewModel.showingNewItemView = true
                },
                       label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "7TW2REfLheb7r2hrhGu76uwSOhY2")
}

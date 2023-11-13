//
//  ToDoListItemView.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName:  item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoListItem(
        id: "123",
        title: "Get some milk",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false)
    )
}

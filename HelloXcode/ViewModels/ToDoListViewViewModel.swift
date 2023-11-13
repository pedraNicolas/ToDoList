//
//  ToDoListViewViewModel.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    ///  Delete to  do list item
    /// - Parameter id: item id to delete
    func delete(id: String ){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

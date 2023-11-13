//
//  ToDoListItemViewViewModel.swift
//  HelloXcode
//
//  Created by Nicolas Pedra on 09/11/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        //Get currents user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore() 
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary()) 
    }
    
}

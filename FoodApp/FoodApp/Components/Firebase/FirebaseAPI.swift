//
//  FirebaseAPI.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/22/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import Firebase

class FirebaseAPI {
    
    private let firestore = Firestore.firestore()
    
    
    public func registerUser(userProfile: UserProfile, password: String, completion: @escaping (Error?, User?) -> Void) {
        
        Auth.auth().createUser(withEmail: userProfile.email, password: password, completion: { (authDataResult, error) in
            
            if (error != nil) {
                completion(error, nil)
                return
            }
            
            if let user = authDataResult?.user {
                
                let docRef = self.firestore.collection("Users").document(user.uid)
                
                var dictionary = userProfile.dictionary
                dictionary.updateValue(docRef.documentID, forKey: "id")
                
                docRef.setData(dictionary)
                completion(nil, user)
                
                return
            }
   //         completion(error, nil)
        })
        
    }
    
    public func loginUser(email: String, password: String, completion: @escaping (Error?, User?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (authDataResult, error) in
            
            if (error != nil) {
                completion(error, nil)
                return
            }
            
            if let user = authDataResult?.user {
                completion(nil, user)
                return
            }
            
        })
    }
    
    // TODO: finish
    public func getUserWithUID() {
        
    }
    
    // TODO: finish
    public func getMenuCategories(completion: @escaping ([MenuCategory], Error?) -> Void) {
        
        // collection reference to MenuCategories
        let menuCategoriesRef = firestore.collection("MenuCategories")
        // get all documents from the MenuCategories collection
        menuCategoriesRef.getDocuments(completion: <#T##FIRQuerySnapshotBlock##FIRQuerySnapshotBlock##(QuerySnapshot?, Error?) -> Void#>)
    }
    
    // TODO: finish
    public func getMenuItems(menuCategory: MenuCategory, completion: @escaping ([MenuItem], DocumentReference, Error?) -> Void) {
        
        let menuItemsRef = firestore.collection("MenuItems").document(menuCategory.menuItemsId)
        
        menuItemsRef.getDocument(completion: <#T##FIRDocumentSnapshotBlock##FIRDocumentSnapshotBlock##(DocumentSnapshot?, Error?) -> Void#>)
    }
    
    public func submitReview() {
        
    }
    
    public func updateReviews() {
        
    }
    
    public func newOrder() {
        
    }
    
}
 

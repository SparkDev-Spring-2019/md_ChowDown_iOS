//
//  FirebaseAPI.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/30/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

class FirebaseAPI {
    
    private let firestore = Firestore.firestore()
    
        public func loginUser(email: String, password: String, completion: @escaping (Error?, User?) -> Void) {
    
            Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
    
                if error != nil {
                    completion(error, nil)
                    return
                }
    
                if let user = authDataResult?.user {
                    completion(nil, user)
                    return
                }
            }
        }
    
        public func registerUser(profile: UserProfile, password: String, completion: @escaping(Error?,User?)-> Void){
    
            Auth.auth().createUser(withEmail: profile.email, password: password) { (authResult, error) in
    
                if error != nil{
                    completion(error,nil)
                    return
                }
    
                if let user = authResult?.user{
                    
                    let documentRef = self.firestore.collection("Users").document(user.uid)
                    var dictionary = profile.dictionary
                    dictionary.updateValue(documentRef.documentID, forKey:"id")
                    documentRef.setData(dictionary)
                    completion(nil,user)
                    return
                }
            }
        }
    
    public func getMenuCategories(completion: @escaping ([MenuCategory], Error?) -> Void) {
        
        let menuCategoriesRef = firestore.collection("Categories")
        
        
        menuCategoriesRef.getDocuments() { (querySnapshot, err) in
            
            if err != nil {
                
                print("Error getting documents: \(err)")
                completion([], err)
                
            } else {
                
                do {
                    
                    var menuCategories = [MenuCategory]()
                    
                    for document in querySnapshot!.documents {
                        
                        let dict = document.data()
                        let data = try JSONSerialization.data(withJSONObject: dict, options: [])
                        let category = try JSONDecoder().decode(MenuCategory.self, from: data)
                        menuCategories.append(category)
                        
                    }
                    
                    completion(menuCategories, nil)
                    
                } catch {
                    
                    print(err)
                    
                }
                
            }
        }
    }
    
    public func getMenuItems(menuCategory: MenuCategory, completion: @escaping ([MenuItem], Error?) -> Void) {

        let menuItemsRef = firestore.collection("Foods")

            menuItemsRef.whereField("category", arrayContains: menuCategory.categoryId)
                .getDocuments() { (querySnapshot, err) in

//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
//                    }
//                }
    
                if err != nil {

                    print("Error getting documents: \(err)")
                    completion([], err)

                } else {

                    do {

                        var menuItems = [MenuItem]()

                        for document in querySnapshot!.documents {

                            let dict = document.data()
                            
                            let menuItem = try FirestoreDecoder().decode(MenuItem.self, from: dict)
                            print("Menu item: \(menuItem)")
                            
                            menuItems.append(menuItem)

                        }

                        completion(menuItems, nil)

                    } catch {

                        print(err)

                    }

                }
            }

        }
    }
    

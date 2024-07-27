//
//  UsersDAO.swift
//  swiftuicoredatastudy
//
//  Created by kenan on 27.07.2024.
//

import Foundation
import CoreData

class UsersDAO{
    let context = persistentContainer.viewContext
    
    func saveUser(user_name:String,user_phone:String){
        let user = Users(context:context)
        user.user_name = user_name
        user.user_phone = user_phone
        saveContext()
    }
    
    func getAllUsers(){
        do{
            let userList = try context.fetch(Users.fetchRequest())
            for user in userList{
                print("---------------------")
                print("User name: \(user.user_name!)")
                print("User phone: \(user.user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    func removeUser(user:Users){
        context.delete(user)
        saveContext()
        getAllUsers()
    }
    
    func updateUser(user:Users,user_name:String,user_phone:String){
        user.user_name = user_name
        user.user_phone = user_phone
        saveContext()
    }
    
    func search(wordToBeSearched:String){
        do{
            let fr = Users.fetchRequest()
            fr.predicate = NSPredicate(format:"user_name CONTAINS[c] %@",wordToBeSearched)
            let list = try context.fetch(fr)
            
            for user in list{
                print("-------------")
                print("User name \(user.user_name!)")
                print("User phone \(user.user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getOneUserByName(user_name:String){
        do{
            let fr = Users.fetchRequest()
            fr.predicate = NSPredicate(format: "user_name == %@", user_name)
            let list = try context.fetch(fr)
            
            for user in list{
                print("-------------")
                print("User name \(user.user_name!)")
                print("User phone \(user.user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func checkRecords(user_name:String){
        do{
            let fr = Users.fetchRequest()
            fr.predicate = NSPredicate(format: "user_name == %@", user_name)
            let list = try context.fetch(fr)
            
            for user in list{
                print("-------------")
                print("User name \(user.user_name!)")
                print("User phone \(user.user_phone!)")
            }
        }catch{
            print(error.localizedDescription)
        }
    }
}

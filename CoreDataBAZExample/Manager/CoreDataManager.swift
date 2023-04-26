//
//  CoreDataManager.swift
//  CoreDataBAZExample
//
//  Created by Benny Reyes on 26/04/23.
//

import CoreData

class CoreDataManager {
    
    let container:NSPersistentContainer!
    
    init(){
        container = NSPersistentContainer(name: "ModelExample")
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        setupDataBase()
    }
    
    func setupDataBase(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error cargando CoreData: \(desc) - \(error)")
                return
            }
            print("La base de datos esta lista!")
        }
    }
    
    // MARK: CRUD
    func createUser(name:String, phone:String){
        let context = container.viewContext
        let user = UserEntity(context: context)
        user.name = name
        user.phone = phone
        do{
            try context.save()
        }catch{
            print("Error al crear usuario \(name)")
        }
    }
    
    func updateUser(_ user:UserEntity){
        do{
            try container.viewContext.save()
        }catch{
            print("Error al actualizar al usuario \(user.name ?? "")")
        }
    }
    
    func deleteUser(_ user:UserEntity){
        container.viewContext.delete(user)
        do{
            try container.viewContext.save()
        }catch{
            print("Error al actulizar core data")
        }
        
    }
    
    func getUsers()->[UserEntity]{
        let request:NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do{
            let array = try container.viewContext.fetch(request)
            return array
        }catch{
            print("Error al cargar los empleados - \(error)")
        }
        return []
    }
    
}

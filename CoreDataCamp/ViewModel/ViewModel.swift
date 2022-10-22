//
//  ViewModel.swift
//  CoreDataCamp
//
//  Created by Rogerio Pires on 22/10/22.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var saveEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { (description, error) in
            if error != nil {
                print("Error")
            } else {
                print("SuccessFully load Core Data!")
            }
        }
        fetchFruits()
        
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
          saveEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fech. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error Saved. \(error)")
        }
    }
}

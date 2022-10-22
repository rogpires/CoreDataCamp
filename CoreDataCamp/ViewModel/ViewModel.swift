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
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error")
            }
        }
        
    }
}

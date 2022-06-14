//
//  ListaSuperCoreDataManager.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 14/06/22.
//

import Foundation
import CoreData

class ListaSuperCoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: ListaSuperCoreDataManager = ListaSuperCoreDataManager()
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "ListaModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
        
    }
    
}

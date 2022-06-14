//
//  FinalProjectIOSApp.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import SwiftUI
import Firebase

@main
struct FinalProjectIOSApp: App {
    
    let persistentContainer = ListaSuperCoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}

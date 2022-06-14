//
//  ListaSuperItem.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 14/06/22.
//

import Foundation

struct ListaSuperItem: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
 

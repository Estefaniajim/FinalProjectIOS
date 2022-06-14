//
//  ViewModelListaSuper.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 14/06/22.
//

import Foundation

class ViewModelListaSuper: ObservableObject{
    
    @Published var items: [ListaSuperItem] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ListaSuperItem(title: "Carne", isCompleted: false),
            ListaSuperItem(title: "Ajo", isCompleted: true),
            ListaSuperItem(title: "Pimienta", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}

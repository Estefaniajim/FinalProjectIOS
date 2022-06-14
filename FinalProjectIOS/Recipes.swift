//
//  Recipes.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 13/06/22.
//

import Foundation

struct Recipe: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case duration
        case complexity
        case recipe
    }
    
    var id = UUID()
    var name: String
    var duration: String
    var complexity: String
    var recipe: String
}

class ReadData: ObservableObject  {
    @Published var recipes = [Recipe]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "Userdata", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let recipes = try? JSONDecoder().decode([Recipe].self, from: data!)
        self.recipes = recipes!
        
    }
     
}

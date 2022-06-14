//
//  ListaDeSuper.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import SwiftUI
import Foundation

enum Priority: String, Identifiable, CaseIterable {
    
    var id: UUID{
        return UUID()
    }
    
    case low = "Comida"
    case medium = "Recetas"
    case high = "Otros"
}

extension Priority {
    
    var title: String{
        switch self{
        case .low:
            return "Comida"
        case .medium:
            return "Recetas"
        case .high:
            return "Otros"
        }
    }
}

struct ListaDeSuper: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: false)]) private var allItems: FetchedResults<Item>

    
    
    private func saveItem(){
        
        do {
            let item = Item(context: viewContext)
            item.name = title
            item.priority = selectedPriority.rawValue
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func styleForPriority(_ value: String) -> Color {
        
        let priority = Priority(rawValue: value)
        
        
        switch priority {
        case .low:
            return Color.green
        case .medium:
            return Color.orange
        case .high:
            return Color.red
        default:
            return Color.black
        }
    }
    
    private func deleteTask(at offsets: IndexSet){
        offsets.forEach{ index in
            let task = allItems[index]
            viewContext.delete(task)
            
            do{
                try viewContext.save()
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack{
            TextField("Nombre", text: $title)
            .textFieldStyle(.roundedBorder)
            Picker("Tienda", selection: $selectedPriority){
                ForEach(Priority.allCases) { priority in
                    Text(priority.title).tag(priority)
                }
            }
            .pickerStyle(.segmented)
            
            Button("Guardar"){
                saveItem()
            }
            //.padding(10)
            //.frame(maxWidth: .infinity)
            //.background(Color.blue)
            //.foregroundColor(.white)
            //clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            List{
                ForEach(allItems){ task in
                    HStack{
                        Circle()
                            .fill(styleForPriority(task.priority!))
                            .frame(width: 15, height: 15)
                        Spacer()
                            .frame(width: 20)
                        Text(task.name ?? "")
                    }
                    
                }
                .onDelete(perform: deleteTask)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Lista de super")
    }
    
    
    
}

struct ListaDeSuper_Previews: PreviewProvider {
    static var previews: some View {
        let persistenContainer = ListaSuperCoreDataManager.shared.persistentContainer
        ListaDeSuper().environment(\.managedObjectContext, persistenContainer.viewContext)
    }
}


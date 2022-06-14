//
//  ListaDeSuper.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import SwiftUI
import Foundation


struct ListaDeSuper: View {
    
    @ var listViewModel: ViewModelListaSuper
    @State var items: [ListaSuperItem] = [
        ListaSuperItem(title: "Carne", isCompleted: false),
        ListaSuperItem(title: "Ajo", isCompleted: true),
        ListaSuperItem(title: "Pimienta", isCompleted: false)
    ]
    
    var body: some View {
        ZStack(alignment: .top){
            List{
                ForEach(items) { item in
                    ListaSuperRow(item: item)
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }
            .padding()
            .navigationBarTitle("Lista de super", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: ListaSuperAddView()))
            .listStyle(PlainListStyle())
        }
        
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
}

struct ListaDeSuper_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeSuper()
    }
}

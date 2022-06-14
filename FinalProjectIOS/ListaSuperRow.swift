//
//  ListaSuperRow.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 14/06/22.
//

import SwiftUI

struct ListaSuperRow: View {
    
    let item: ListaSuperItem
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListaSuperRow_Previews: PreviewProvider {
    
    static var item1 = ListaSuperItem(title: "Primer objecto", isCompleted: false)
    
    static var previews: some View {
        ListaSuperRow(item: item1)
    }
}

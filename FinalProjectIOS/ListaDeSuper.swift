//
//  ListaDeSuper.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import Foundation
import SwiftUI

struct ListaDeSuper: View {
                        
    @State var name: String = ""
    @State var quantity: String = ""
    
    var body: some View {
        ZStack(alignment: .top){
            List{
                Section(header: Text("Nuvo objeto")){
                    HStack{
                        VStack{
                            TextField("Nombre", text: $name)
                            TextField("Cantidad", text: $quantity)
                                .keyboardType(.numberPad)
                        }
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Save item")
                        })
                    }
                }
                
                Section{
                    Text("abc")
                }
            }
            
            .padding()
        }
        .navigationBarTitle("Lista de super", displayMode: .inline)
        
    }
}

struct ListaDeSuper_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeSuper()
    }
}

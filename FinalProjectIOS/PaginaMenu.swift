//
//  PaginaMenu.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import Foundation
import SwiftUI

struct PaginaMenu: View {
    
    @StateObject var listViewModel: ViewModelListaSuper = ViewModelListaSuper()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TipsYRecetas()) {
                    Text("Tips y Recetas")
                }
                
                NavigationLink(destination: ListaDeSuper()) {
                    Text("Lista del super")
                }
                NavigationLink(destination: EnlaceAhumadores()) {
                    Text("Enlace a ahumadores")
                }
                NavigationLink(destination: Temperatura()) {
                    Text("Temperatura")
                }
            }
            .navigationTitle("Página menú")
        }.navigationBarHidden(true)
            .environmentObject(listViewModel)
            
    }
    
}

struct PaginaMenu_Previews: PreviewProvider {
    static var previews: some View {
        PaginaMenu()
    }
}

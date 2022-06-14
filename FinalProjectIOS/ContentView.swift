//
//  ContentView.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var contraseña: String = ""
    
    
    
    var body: some View {
        NavigationView {
            List {
                Text("Usuario")
                TextField(text: $username, prompt: Text("Required")) {
                    Text("Username")
                }
                Text("Contraseña")
                SecureField(text: $contraseña, prompt: Text("Required")) {
                    Text("Contraseña")
                }
                NavigationLink(destination: PaginaMenu()) {
                    Text("Iniciar sesión")
                }
                .padding()
                NavigationLink(destination: CrearNuevoUsuario()) {
                    Text("Crear usuario")
                }
                .padding()
            }
            .navigationTitle("Inicio de sesión")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

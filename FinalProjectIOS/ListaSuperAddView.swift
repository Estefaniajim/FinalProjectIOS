//
//  ListaSuperAddView.swift
//  FinalProjectIOS
//
//  Created by gdaalumno on 14/06/22.
//

import SwiftUI

struct ListaSuperAddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Nombre del objeto", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        
                })
            }
            .padding(14)
        }
        .navigationTitle("Añade un objeto")
    }
}

struct ListaSuperAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListaSuperAddView()
        }
        
    }
}

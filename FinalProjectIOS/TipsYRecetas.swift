//
//  TipsYRecetas.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            Image("burger")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipped()
            Text(recipe.name)
            .font(.title)
            .fontWeight(.black)
            
            VStack {
                Text(recipe.complexity)
                    .fontWeight(.heavy)
                Text("\(recipe.duration)")
                    .fontWeight(.heavy)
            }
            Text(recipe.recipe)
                
            
            Spacer()
        }
    }
}

struct Reciperow: View {
    var recipe: Recipe
    
    
    var body: some View {
        VStack{
            Text(recipe.name)
                .font(.title2)
                .fontWeight(.black)
                HStack {
                    VStack(alignment: .leading) {
                        Image("burger")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 150)
                                .clipped()
                        Text(recipe.duration)
                            .font(.subheadline).foregroundColor(.gray)
                        Text(String("Complexity: \(recipe.complexity)"))
                                .font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    
                }
            }
        }
        
}

struct TipsYRecetas: View {
    @ObservedObject var recipeData = ReadData()
    
    var body: some View {
            List(recipeData.recipes){ recipe in
                NavigationLink(destination: DetailView(recipe: recipe)){
                    Reciperow(recipe: recipe)
                }
            }
    }
        
}

struct TipsYRecetas_Previews: PreviewProvider {
    static var previews: some View {
        TipsYRecetas()
    }
}

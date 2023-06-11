//
//  DetailCocktailIngredientView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct DetailCocktailIngredientView: View {
    var ingredients: [String: String]
    var body: some View {
        List(ingredients.sorted(by: <), id: \.key) { key, value  in
           IngredientsRowView(ingregient: key, measure: value).listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct DetailCocktailIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCocktailIngredientView(ingredients: ["String": "String"])
    }
}

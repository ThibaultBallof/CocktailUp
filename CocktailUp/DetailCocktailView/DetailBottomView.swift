//
//  DetailBottomView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct DetailBottomView: View {

    @EnvironmentObject var viewModel: ViewModel
    let drink: Drink

    var body: some View {
        ButtonView().padding().environmentObject(viewModel)
        if viewModel.selectedButton == .instruction {
            DetailCocktailListView(inscruction: drink.strInstructions)
        } else {
            DetailCocktailIngredientView(ingredients: drink.ingredientDictionary)
        }
    }
}

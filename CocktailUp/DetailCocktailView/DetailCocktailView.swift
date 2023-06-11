//
//  DetailCocktailView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct DetailCocktailView: View {
    @State private var isToggleOn = false
    @EnvironmentObject var viewModel: ViewModel
    @State private var isImageExpanded = true

    let drink: Drink

    var body: some View {
        ZStack {
            VStack {
                if isImageExpanded {
                    if let imageUrl = drink.strDrinkThumb {
                        TopDetailView(imageUrlDrink: imageUrl)
                            .frame(maxWidth: 450, maxHeight: 300)
                        .onTapGesture {
                            withAnimation {
                                isImageExpanded.toggle()
                            }
                        }
                    }

                }
                Text(drink.strDrink)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                DetailBottomView(drink: drink).environmentObject(viewModel)
                    .onTapGesture {
                        withAnimation {
                            isImageExpanded.toggle()
                        }
                    }

                Spacer()
            }
        }

    }
}

struct DetailCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCocktailView(drink: Drink(idDrink: "", strDrink: "99", strDrinkAlternate: "", strTags: "", strVideo: "", strCategory: "", strIBA: "", strAlcoholic: "", strGlass: "", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strInstructionsES: "", strInstructionsDE: "", strInstructionsFR: "", strInstructionsIT: "", strInstructionsZH_HANS: "", strInstructionsZH_HANT: "", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/vr6kle1504886114.jpg", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strImageSource: "", strImageAttribution: "", strCreativeCommonsConfirmed: "", dateModified: ""))
            .environmentObject(ViewModel())
    }
}

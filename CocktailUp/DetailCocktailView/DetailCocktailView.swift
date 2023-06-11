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
        DetailCocktailView(drink: drinkExample).environmentObject(ViewModel())
    }
}

//
//  CocktailView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 07/06/2023.
//

import SwiftUI
import IsScrolling

struct CocktailView: View {
    @EnvironmentObject private var viewModel: ViewModel
    @State var isListScrolling = false
    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    if let error = viewModel.error {
                        ErrorView(errorTupple: viewModel.handleURLSessionError(error))
                    } else {
                        ForEach(viewModel.drinks.drinks, id: \.self) { drink in
                            VStack {
                                NavigationLink(destination: DetailCocktailView(drink: drink).environmentObject(viewModel)) {
                                    CocktailRow(title: drink.strDrink, subtitle: drink.strCategory, imageUrl: "\(drink.strDrinkThumb)/preview")
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .listStyle(.plain)
                        .padding()
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "searchBar_placeholder")
    }
}

struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailView().environmentObject(ViewModel())
    }
}

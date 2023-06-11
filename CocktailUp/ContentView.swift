//
//  ContentView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 06/06/2023.
//

import SwiftUI
import Combine

struct ContentView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
            TabView {
                CocktailView().environmentObject(viewModel)
                    .tabItem {
                        Image("cocktail")
                    }
                ShakeView().environmentObject(viewModel)
                    .tabItem {
                        Image("shaker")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

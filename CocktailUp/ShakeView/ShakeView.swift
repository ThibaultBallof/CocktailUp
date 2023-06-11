//
//  ShakeView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct ShakeView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isShowingDetailView = false
    @State private var isShowingHelpView = false

    var body: some View {
        VStack {
            Text("shake_view_description")
                .multilineTextAlignment(.center)
                .bold()
                .font(.system(size: 20))
                .padding()
            LottieView(name: "drink")
                .onShake {
                    if !isShowingHelpView {
                        viewModel.fetchRandomCocktail()
                        isShowingDetailView = true
                    }
                }.frame(width: 300, height: 300)
                .sheet(isPresented: $isShowingDetailView) {
                    if let randomDrink = viewModel.randomDrink {
                        DetailCocktailView(drink: randomDrink)
                            .environmentObject(viewModel)
                    }
                }
            Button {
                isShowingHelpView = true
            } label: {
                Image(systemName: "info.circle")
                    .foregroundColor(.red)
                    .font(.system(size: 30))
            }
            .fullScreenCover(isPresented: $isShowingHelpView) {
                HelpShakeView()
                    .clearModalBackground()
            }
        }
    }
}

struct ShakeView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeView().environmentObject(ViewModel())
    }
}

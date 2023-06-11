//
//  ButtonView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        HStack {
            Spacer()
            Button {
                viewModel.selectedButton = .instruction

            } label: {
                Text("insctruction")
                    .filterButtonSize(selected: viewModel.selectedButton == .instruction)
            }
            .filterButton(isTouched: viewModel.selectedButton == .instruction)

            Button {
                viewModel.selectedButton = .ingredient

            } label: {
                Text("ingredient")
                    .filterButtonSize(selected: viewModel.selectedButton == .ingredient)
            }
            .filterButton(isTouched: viewModel.selectedButton == .ingredient)
            Spacer()
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView().environmentObject(ViewModel())
    }
}

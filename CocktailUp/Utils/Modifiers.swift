//
//  Modifiers.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 07/06/2023.
//

import SwiftUI

private struct CenterHorizontallyModifier: ViewModifier {

    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {

    func centerHorizontally() -> some View {
        modifier(CenterHorizontallyModifier())
    }

    func addShadow() -> some View {
        self
            .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .shadow(radius: 3))
    }

    @ViewBuilder func filterButton(isTouched: Bool) -> some View {
        if isTouched {
            self
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(17)

        } else {
            self
                .foregroundColor(.red)
                .cornerRadius(17)
                .overlay(
                    RoundedRectangle(cornerRadius: 17)
                        .stroke(.red, lineWidth: 1)
                )
        }
    }

    @ViewBuilder func filterButtonSize(selected: Bool) -> some View {
        if selected {
            self
                .padding(EdgeInsets(top: 7, leading: 24, bottom: 7, trailing: 24))
        } else {
            self
                .padding(EdgeInsets(top: 6, leading: 23, bottom: 6, trailing: 23))
        }
    }
}

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

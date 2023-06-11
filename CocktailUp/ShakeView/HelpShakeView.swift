//
//  HelpShakeView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct HelpShakeView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            LottieView(name: "shake-phone").onShake {
                dismiss()
            }
            .frame(width: 300, height: 300)
            Text("shake_view_help_string")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
            Spacer()
            Button {
                dismiss()
            } label: {
                Circle()
                    .fill(.red)
                    .frame(width: 42)
                    .overlay {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 20))

                    }
            }
            Spacer()
        }
    }
}

struct HelpShakeView_Previews: PreviewProvider {
    static var previews: some View {
        HelpShakeView()
    }
}

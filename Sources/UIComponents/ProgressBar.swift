//
//  ProgressBar.swift
//  PublicTransportCalculator
//
//  Created by Christian Seiler on 18.07.20.
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import SwiftUI

public struct ProgressBar: View {

    @Binding var value: Double
    @Binding var max: Double

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: self.height)
                    .opacity(self.opacity)
                    .foregroundColor(Color(UIColor.systemTeal))

                Rectangle()
                    .frame(width: self.width(for: geometry.size),
                           height: self.height)
                    .foregroundColor(Color(UIColor.systemBlue))
            }
            .cornerRadius(self.cornerRadius)
        }

    }

    // Constants
    private let height: CGFloat = 5
    private let cornerRadius: CGFloat = 45
    private let opacity = 0.3

    private func width(for size: CGSize) -> CGFloat {
        min(CGFloat(value / max) * size.width, size.width)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProgressBar(value: .constant(0), max: .constant(10))
            ProgressBar(value: .constant(1), max: .constant(10))
            ProgressBar(value: .constant(5), max: .constant(10))
            ProgressBar(value: .constant(10), max: .constant(10))
            Spacer()
        }
        .padding()
    }
}

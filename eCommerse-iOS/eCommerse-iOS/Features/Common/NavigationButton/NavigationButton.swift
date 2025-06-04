//
//  NavigationButton.swift
//  FreeToGame
//
//  Created by Yan Cervantes on 03/12/24.
//

import SwiftUI

struct NavigationButton: View {
  let imageName: String
  let countItems: Int = 0
  var action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        Image(systemName: imageName)
          .foregroundStyle(.secondary)
        Text("\(countItems)")
          .font(.system(size: 10, weight: .semibold))
          .foregroundStyle(.white)
      }
    }
  }
}

#Preview {
  NavigationButton(imageName: "bag.fill",
                   action: { } )
}

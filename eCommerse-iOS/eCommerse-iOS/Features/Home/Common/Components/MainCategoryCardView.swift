//
//  MainCategoryCardView.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 05/06/25.
//

import SwiftUI

struct MainCategoryCardView: View {
  
  @EnvironmentObject var navigation: NavigationManager
  var categoryProduct: CategoryProducts
  
  var body: some View {
    Button {
      navigation.add(.productDetail)
    } label: {
      VStack(spacing: 10) {
        Image(categoryProduct.image)
        Text(categoryProduct.name)
          .font(.system(size: 16, weight: .semibold))
          .foregroundStyle(Color.accentColor.opacity(0.6))
      }
      .frame(width: 180, height: 150, alignment: .center)
    }
  }
}

#Preview {
  MainCategoryCardView(categoryProduct: CategoryProducts(name: "electronics", image: "electronics", products: []))
    .environmentObject(NavigationManager())
}

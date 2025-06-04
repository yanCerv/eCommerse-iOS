//
//  HomeView.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject var navigation: NavigationManager
  @State var viewModel: HomeViewModel = HomeViewModel()
  
  var body: some View {
    VStack {
      Text(viewModel.mainCategory.name)
        .font(.system(size: 25, weight: .semibold))
        .foregroundStyle(Color.red.opacity(0.6))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
      ScrollView {
        LazyVGrid(columns: viewModel.columns) {
          ForEach(viewModel.mainCategory.categoryProducts, id: \.self) { categoryProduct in
            MainCategoryCardView(categoryProduct: categoryProduct)
          }
        }
      }
      .task {
        await viewModel.didFetchProducts()
      }
    }
  }
}

#Preview {
  HomeView(viewModel: HomeViewModel())
    .environmentObject(NavigationManager())
}

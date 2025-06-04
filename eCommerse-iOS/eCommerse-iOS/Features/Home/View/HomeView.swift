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
    ScrollView {
      
    }
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
    .task {
      await viewModel.didFetchProducts()
    }
  }
}

#Preview {
  HomeView(viewModel: HomeViewModel())
    .environmentObject(NavigationManager())
}

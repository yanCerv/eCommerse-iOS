//
//  MainTabView.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

import SwiftUI

struct MainTabView: View {
  
  @EnvironmentObject var navigation: NavigationManager
  
  var body: some View {
    NavigationStack(path: $navigation.paths) {
      TabView {
        Tab("Categories", systemImage: "house.fill") {
          HomeView()
        }
      }
      .navigationTitle("Store")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        NavigationButton(imageName: "bag.fill") {
          
        }
      }
      .navigationDestination(for: NavigationPath.self) { path in
        switch path {
        case .productDetail:
          Text("Product Detail")
        }
      }
    }
  }
}

#Preview {
  MainTabView()
    .environmentObject(NavigationManager())
}

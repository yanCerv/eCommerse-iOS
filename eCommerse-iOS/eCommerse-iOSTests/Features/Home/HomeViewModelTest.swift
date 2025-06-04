//
//  HomeViewModelTest.swift
//  eCommerse-iOSTests
//
//  Created by Yan Cervantes on 04/06/25.
//

import XCTest
@testable import eCommerse_iOS

final class HomeViewModelTest: XCTestCase {
  
  var homeViewModel: HomeViewModel!
  
  @MainActor
  override func setUpWithError() throws {
    homeViewModel = HomeViewModel(client: HomeClient(serviceType: .mock))
  }
  
  override func tearDownWithError() throws {
    homeViewModel = nil
  }
  
  @MainActor
  func testData() async {
    XCTAssertNotNil(homeViewModel)
    
      _ = await homeViewModel.didFetchProducts()
    
    XCTAssertTrue(homeViewModel.showAlert == false)
    XCTAssertTrue(homeViewModel.errorMessage == "")
    XCTAssertTrue(homeViewModel.isDataLoaded == true)
    XCTAssertTrue(homeViewModel.products != [])
  }
  
}

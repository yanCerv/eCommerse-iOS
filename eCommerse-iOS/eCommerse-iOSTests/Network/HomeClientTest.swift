//
//  HomeClientTest.swift
//  eCommerse-iOSTests
//
//  Created by Yan Cervantes on 04/06/25.
//

import XCTest
@testable import eCommerse_iOS

final class HomeClientTest: XCTestCase {
  
  var homeCLient: HomeClient!
  var data: [Product]!
  
  @MainActor
  override func setUpWithError() throws {
    self.homeCLient = HomeClient(serviceType: .mock)
  }
  
  override func tearDownWithError() throws {
    homeCLient = nil
    data = nil
  }
  
  @MainActor
  func testHomeClient() async {
    XCTAssertNotNil(homeCLient)
    
    do {
      data = try await homeCLient.getProducts()
      XCTAssertTrue(data != nil)
      XCTAssertFalse(data.isEmpty)
    } catch {
      XCTFail("Fail but expect success")
    }
  }
}

//
//  HomeClient.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

actor HomeClient {
  
  var request: Request
  var serviceType: ServiceType
  
  //MARK: Init
  
  init(request: Request = Request.shared, serviceType: ServiceType = .service) {
    self.request = request
    self.serviceType = serviceType
  }
  
  //MARK: Methods
  
  func getProducts() async throws -> [Product] {
    if serviceType == .mock {
      return mockProducts()
    } else {
      let resource = HomeClientResource.products.config
      return try await request.request(resource)
    }
  }
  
  private func mockProducts() -> [Product] {
    if let mockData = try? JsonResource.getFrom("MockProducts", type: [Product].self) {
      return mockData
    }
    return []
  }
}

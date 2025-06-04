//
//  HomeClientResource.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

import Foundation

enum HomeClientResource {
  case products
}

extension HomeClientResource {
  var config: RequestConfiguration {
    switch self {
    case .products:
      let path = "/products"
      return RequestConfiguration(path: path, method: .get)
    }
  }
}

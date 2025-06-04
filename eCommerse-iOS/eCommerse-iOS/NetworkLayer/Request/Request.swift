//
//  Request.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

import Foundation

actor Request {
  static let shared: Request = Request()
  
  var sessionDelegate: URLSession {
    let sessionHolder = ClientSessionHolder()
    return URLSession(configuration: .default, delegate: sessionHolder, delegateQueue: nil)
  }
  
  func request<T: Decodable>(_ configuration: RequestConfiguration) async throws -> T {
    let request = configuration.request
    let (data, response) = try await sessionDelegate.data(for: request)
    if let response = response as? HTTPURLResponse,
       (200...299).contains(response.statusCode) {
      return try JSONDecoder().decode(T.self, from: data)
    } else {
      let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
      throw ErrorHandler.error(message: "Error", statusCode: statusCode)
    }
  }
}

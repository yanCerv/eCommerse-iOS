//
//  Product.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

struct Product: Decodable, Hashable {
  let id: Int
  let title: String
  let price: Double
  let description: String
  let category: String
  let image: String
  let rating: Rating
}

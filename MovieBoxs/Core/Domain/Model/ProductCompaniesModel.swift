//
//  ProductCompaniesModel.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation

struct ProductionCompaniesModel: Equatable, Identifiable {
  let id: Int
  let logoPath: String
  let name: String
  let originalCountry: String
}

//
//  VideoModel.swift
//  MovieBoxs
//
//  Created by Rarito on 17/08/23.
//

import Foundation

struct VideoModel: Equatable, Identifiable {
  let name, key: String
  let site: String
  let size: Int
  let type: String
  let official: Bool
  let publishedAt, id: String
}

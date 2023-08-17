//
//  MovieEntity.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
  @objc dynamic var id: Int = 0
  @objc dynamic var title: String = ""
  @objc dynamic var overview: String = ""
  @objc dynamic var voteAverage: Double = 0
  @objc dynamic var posterPath: String = ""
  @objc dynamic var backdropPath: String = ""
  @objc dynamic var releaseDate: String = ""

  override static func primaryKey() -> String? {
    return "id"
  }
}

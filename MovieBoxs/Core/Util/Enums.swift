//
//  Enums.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation

public enum Tabs {
  case home
  case search
  case favorite
}

enum ProgressState {
  case idle
  case loading
  case error(Error)
  case loaded
}

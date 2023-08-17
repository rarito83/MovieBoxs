//
//  MovieBoxsApp.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

@main
struct MovieBoxsApp: App {

  let inject = Injection()
  
  var body: some Scene {
    WindowGroup {
      MainTabView()
    }
  }
}

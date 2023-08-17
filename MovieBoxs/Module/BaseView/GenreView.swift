//
//  GenreView.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

struct GenreView: View {
  
  var genre: GenreModel
  
  init(genre: GenreModel) {
    self.genre = genre
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .stroke(Color.black, lineWidth: 2)
        .frame(width: 140, height: 40)
        .padding(8)
      Text("\(genre.name)")
    }
  }
}

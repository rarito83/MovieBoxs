//
//  HomeRouter.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for movie: MovieModel) -> some View {
      let detailUseCase = Injection.init().provideDetail()
      let favoriteUseCase = Injection.init().provideFavorites()
      let presenter = DetailPresenter(movie: movie,
          detailUseCase: detailUseCase,
          favoriteUseCase: favoriteUseCase)
      return DetailView(presenter: presenter)
  }
}

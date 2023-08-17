//
//  HomeRouter.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for movie: MovieModel) -> some View {
      let injection = Injection()
      let detailUseCase = injection.provideDetail()
      let presenter = DetailPresenter(movie: movie,
          detailUseCase: detailUseCase,
          addFavoriteUseCase: injection.provideAddFavorite(),
          removeFavoriteUseCase: injection.provideRemoveFavorite(),
          getFavoriteUseCase: injection.provideGetFavorites())
      return DetailView(presenter: presenter)
  }
}

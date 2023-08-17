//
//  FavoriteRouter.swift
//  MovieBoxs
//
//  Created by Rarito on 16/08/23.
//

import SwiftUI

class FavoriteRouter {
  
  func makeFavoriteView(for movie: MovieModel) -> some View {
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

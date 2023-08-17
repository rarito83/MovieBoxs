//
//  HomeView.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter

  var body: some View {
    
    NavigationView {
      VStack {
        CarauselView()
        
        VStack {
          ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(presenter.genreMovies, id: \.id) { genre in
                  GenreView(genre: genre).onTapGesture {
                    print("Genre ID: \(genre.id)")
                    self.presenter.fetchMovies(id: genre.id, page: presenter.page)
                  }
                }
              }
          }.padding()
          
          ScrollView(.vertical, showsIndicators: true) {
              VStack {
                ForEach(presenter.movies, id: \.id) { movie in
                  self.presenter.linkBuilder(for: movie) {
                    MovieView(movie: movie)
                  }
                }
              }.padding(.top, 16)
          }
        }
      }.onAppear {
        presenter.fetchGenresMovie()
        presenter.fetchMovies(id: presenter.idGenre, page: presenter.page)
      }
    }
  }
}

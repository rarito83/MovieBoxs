//
//  MovieRepository.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
  func getGenresMovie() -> AnyPublisher<[GenreModel], Error>
  func getListMoviesByGenre(id: Int, page: Int) -> AnyPublisher<[MovieModel], Error>
  func getDetailMovie(idMovie: Int) -> AnyPublisher<DetailMovieModel, Error>
  func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
  func isFavorite(id: Int) -> AnyPublisher<Bool, Error>
  func addFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
  func removeFavorite(id: Int) -> AnyPublisher<Bool, Error>
  func getVideo(id: Int) -> AnyPublisher<VideoModel, Error>
}

final class MovieRepository: NSObject {
  
    typealias MovieInstance = (LocaleDataSource, RemoteDataSource) -> MovieRepository

    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource

    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
      self.locale = locale
      self.remote = remote
    }

    static let sharedInstance: MovieInstance = { locale, remote in
        return MovieRepository(locale: locale, remote: remote)
    }
}

extension MovieRepository: MovieRepositoryProtocol {

  func getGenresMovie() -> AnyPublisher<[GenreModel], Error> {
      return self.remote.getGenres().map {
          MovieMapper.mapGenreResponseToDomain(input: $0)
      }.eraseToAnyPublisher()
  }
  
  func getListMoviesByGenre(id: Int, page: Int) -> AnyPublisher<[MovieModel], Error> {
      return self.remote.getListMoviesByGenre(id: id, page: page).map {
          MovieMapper.mapMovieResponseToDomain(input: $0)
      }.eraseToAnyPublisher()
  }

  func getDetailMovie(idMovie: Int) -> AnyPublisher<DetailMovieModel, Error> {
      print("Repo detail \(idMovie)")
      return self.remote.getDetailMovie(idMovie: idMovie).map { detailResponse in
        MovieMapper.mapDetailMovieResponseToDomains(movieResponse: detailResponse)
      }.eraseToAnyPublisher()
  }

  func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
      return locale.getFavoriteMovie().map {
          MovieMapper.mapFavoriteEntityToDomains(input: $0)
      }.eraseToAnyPublisher()
  }
  
  func isFavorite(id: Int) -> AnyPublisher<Bool, Error> {
      return locale.isFavoriteMovie(id: id)
  }
  
  func addFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
      return locale.addMovieToFavorite(movie: MovieMapper.mapMovieDomainToEntity(input: movie))
          .eraseToAnyPublisher()
  }
  
  func removeFavorite(id: Int) -> AnyPublisher<Bool, Error> {
      return locale.deleteMovieFromFavorite(id: id)
  }
  
  func getVideo(id: Int) -> AnyPublisher<VideoModel, Error> {
      return self.remote.getVideoMovie(idMovie: id).map {
          MovieMapper.mapVideoResponseToDomain(input: $0)
      }.eraseToAnyPublisher()
  }

}

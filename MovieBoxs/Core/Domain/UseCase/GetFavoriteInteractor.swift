//
//  GetFavoriteInteractor.swift
//  MovieBoxs
//
//  Created by Rarito on 16/08/23.
//

import Foundation
import Combine

protocol GetFavoriteUseCase {
    func action() -> AnyPublisher<[MovieModel], Error>
    func statusFavorite(id: Int) -> AnyPublisher<Bool, Error>
}

class GetFavoriteInteractor: GetFavoriteUseCase {
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func action() -> AnyPublisher<[MovieModel], Error> {
        return repository.getFavoriteMovies()
    }
  
    func statusFavorite(id: Int) -> AnyPublisher<Bool, Error> {
        return repository.isFavorite(id: id)
    }
}


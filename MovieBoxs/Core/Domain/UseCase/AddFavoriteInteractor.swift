//
//  AddFavoriteInteractor.swift
//  MovieBoxs
//
//  Created by Rarito on 16/08/23.
//

import Foundation
import Combine

protocol AddFavoriteUseCase {
    func action(movie: MovieModel) -> AnyPublisher<Bool, Error>
}

class AddFavoriteInteractor: AddFavoriteUseCase {
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func action(movie: MovieModel) -> AnyPublisher<Bool, Error> {
        return repository.addFavorite(movie: movie)
    }
}


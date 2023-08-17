//
//  RemoveFavoriteInteractor.swift
//  MovieBoxs
//
//  Created by Rarito on 16/08/23.
//

import Foundation
import Combine

protocol RemoveFavoriteUseCase {
    func action(id: Int) -> AnyPublisher<Bool, Error>
}

class RemoveFavoriteInteractor: RemoveFavoriteUseCase {
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func action(id: Int) -> AnyPublisher<Bool, Error> {
        return repository.removeFavorite(id: id)
    }
}


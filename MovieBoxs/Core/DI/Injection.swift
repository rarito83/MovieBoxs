//
//  Injection.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation
import RealmSwift

class Injection: NSObject {
  
  func provideRepository() -> MovieRepository {
    let realm = try? Realm()
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return MovieRepository.sharedInstance(locale, remote)
  }
  
  func provideHome() -> HomeUseCase {
      let repository = provideRepository()
      return HomeInteractor(repository: repository)
  }
  
  func provideDetail() -> DetailUseCase {
      let repository = provideRepository()
      return DetailInteractor(repository: repository)
  }
  
  func provideFavorites() -> FavoriteUseCase {
      let repository = provideRepository()
      return FavoriteInteractor(repository: repository)
  }
  
}

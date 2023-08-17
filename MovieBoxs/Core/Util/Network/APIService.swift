//
//  APIService.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import Foundation

struct APIService {
  static let baseUrl = "https://api.themoviedb.org/3/"
  static let apiKey = "a7a9271a64bad860e31a939fabd5b93f"
}

struct IMAGE {
  static let imageUrl = "https://image.tmdb.org/t/p/w500"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  enum Gets: Endpoint {
    case genre
    case popular
    case detail
    case video

    public var url: String {
      switch self {
        case .genre: return "\(APIService.baseUrl)genre/movie/list"
        case .popular: return "\(APIService.baseUrl)movie/popular"
        case .detail: return "\(APIService.baseUrl)movie"
        case .video: return "\(APIService.baseUrl)video"
      }
    }
  }
}

func genreMovie(idGenre: Int) -> String { return "\(idGenre)"}
func detailMovie(idMovie: Int) -> String { return "/\(idMovie)"}

enum URLError: LocalizedError {
  
  case invalidResponse
  case addressUnreachable(URL)
  
  var errorDescription: String? {
    switch self {
      case .invalidResponse: return "The server responded with garbage."
      case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
  
}

enum DatabaseError: LocalizedError {
  
  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
      case .invalidInstance: return "Database can't instance."
      case .requestFailed: return "Your request failed."
    }
  }
  
}

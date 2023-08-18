//
//  DetailView.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  init(presenter: DetailPresenter) {
    self.presenter = presenter
  }

  var body: some View {
    ZStack {
      if presenter.detailMovie.title.isEmpty {
        VStack {
          ProgressView().padding()
          Text("Loading...")
        }
      } else {
        ScrollView(.vertical, showsIndicators: true) {
          let detail = presenter.detailMovie
          let _ = presenter.video?.key
          VStack {
            WebImage(url: URL(string: detail.poster))
              .aspectRatio(contentMode: .fill)
              .background(Color.green)
              .frame(width: 400, height: 220)
              .clipped()
              .scaledToFill()
            
            HStack {
              VStack {
                Text(detail.title)
                  .fontWeight(.heavy)
                  .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))

                Text(detail.releaseDate)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
              }

              Spacer()

              VStack(alignment: .leading) {
                Text("Rating")
                  .fontWeight(.heavy)
                  .foregroundColor(.black)
                  .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Text(String(detail.voteAverage))
              }
              .padding(.horizontal)
            }
            
            let isFavorite = presenter.isFavorite
            Button(isFavorite ? "Remove Favorite" : "Add Favorite") {
                if isFavorite {
                    presenter.removeFavorite()
                } else {
                    presenter.addFavorite()
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(isFavorite ? Color.red : Color.green)
            .clipShape(Capsule())
            .padding(10)
            
            Spacer()

            Text("Description")
              .fontWeight(.heavy)
              .font(.title2)
              .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
            Spacer()

            Text(detail.overview)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

            VStack(alignment: .leading) {
              HStack(alignment: .top) {
                VStack(alignment: .leading) {
                  Text("Rating")
                      .fontWeight(.bold)
                  
                  Text(String(detail.voteAverage))
                  
                  Text("Genre")
                      .fontWeight(.bold)
                      .padding(.top)
                  
                  Text(detail.genre)
                  
                  Text("Trailer")
                      .fontWeight(.bold)
                      .padding(.top)
                
                  TrailerView(key: presenter.video?.key ?? "6JnN1DmbqoU")
                    .padding(.top, 8)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              }
              .padding()
            }
          }
        }.padding(.bottom, 20)
      }
    }.onAppear {
        print("Detail value: \(presenter.movie.id)")
        presenter.fetchDetailMovie()
        presenter.fetchMovieTrailer()
        presenter.checkFavorite()
    }
  }
}

struct TrailerView: View {
  var key: String
  
  var body: some View {
    VStack {
      VideoPlayer(player: AVPlayer(
        url: URL(
//          string: "https://www.youtube.com/watch?v=\(key)")!
          string: "https://media.w3.org/2010/05/sintel/trailer.mp4")!
        )
      )
      .frame(width: UIScreen.main.bounds.width - 40, height: 200, alignment: .center)
      .cornerRadius(10)
    }
  }
}

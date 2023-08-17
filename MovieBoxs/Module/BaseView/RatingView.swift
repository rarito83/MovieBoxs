//
//  RatingView.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

struct RatingView: View {
  
  var rating: Double

  public init(_ rating: Double) {
      self.rating = rating
  }

  public var body: some View {
      HStack {
          Image(systemName: "star.fill")
              .resizable()
              .scaledToFit()
              .frame(height: 14)
              .foregroundColor(Color.yellow)

          Text("\(rating, specifier: "%.1f")")
              .font(.system(size: 12))
              .foregroundColor(Color.gray)
      }
  }
}

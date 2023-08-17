//
//  EmptyView.swift
//  MovieBoxs
//
//  Created by Rarito on 17/08/23.
//

import SwiftUI

struct EmptyView: View {
  
  var image: String
  var title: String
  
  var body: some View {
      VStack(spacing: 15) {
          Image(systemName: image)
              .resizable()
              .renderingMode(.original)
              .scaledToFit()
              .foregroundColor(.gray)
              .frame(width: 70)
          
          Text(title)
              .font(.system(.body, design: .rounded))
              .multilineTextAlignment(.center)
      }
  }
}

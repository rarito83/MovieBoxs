//
//  ProfileView.swift
//  MovieBoxs
//
//  Created by Rarito on 15/08/23.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
      VStack(spacing: 20) {
          Image("rarito")
              .resizable()
              .frame(width: 200, height: 200, alignment: .center)
              .scaledToFit()
          Text("Rahmat Susanto")
              .font(Font.title)
              .foregroundColor(.indigo)
          Text("iOS Developer")
              .bold()
      }
  }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

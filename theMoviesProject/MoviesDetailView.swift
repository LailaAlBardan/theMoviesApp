//
//  moviesDetailView.swift
//  theMoviesProject
//
//  Created by laila on 09/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

/* View for the movie detail page. */

struct MoviesDetailView: View {
    var id: Int?
    @State var movieDetails: MovieDetails? = nil
    init(id: Int?) {
        self.id = id!
    }
    
    var body: some View {
        VStack(spacing: 50) {
            WebImage(url: URL(string: Constants.imageLink + (movieDetails?.poster_path ?? "")))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 200, maxHeight: 300, alignment: .top)
                .cornerRadius(14)
            Text(movieDetails?.original_title ?? "")
                .font(.body)
                .fontWeight(.semibold)
            Text(movieDetails?.overview ?? "")
                .padding()
                .font(.body)
            Spacer()
        }
        .onAppear(){
            restAPI().getData(url: Constants.movieDetailsApiEndpoint + String(self.id ?? 0) + Constants.apiAuthKey, type: MovieDetails.self) { (details) in movieDetails = details
            }
        }
    }
}
    

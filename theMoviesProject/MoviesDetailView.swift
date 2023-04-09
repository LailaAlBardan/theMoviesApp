//
//  moviesDetailView.swift
//  theMoviesProject
//
//  Created by laila on 09/04/2023.
//

import SwiftUI

struct MoviesDetailView: View {
    @State var id: Int?
    @State var details: MovieDetails?
    var body: some View {
        Text( "\(id!)")
//            .onAppear() {
//                restAPI().getData(url: Constants.movieDetailsApiEndpoint + "\(id)" + Constants.apiAuthKey, id: nil) { (details) in self.details = details
//                     }
//
//            }
//
    }
}
    

struct MoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailView()
    }
}

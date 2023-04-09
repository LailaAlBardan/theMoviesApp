//
//  ContentView.swift
//  theMoviesProject
//
//  Created by laila on 06/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {
    
    @State var movies: Movies?
    
    var body: some View {
        NavigationStack{
            List(movies?.results ?? []){
                movieTitle in
                HStack{
                    WebImage(url: URL(string: Constants.imageLink + movieTitle.poster_path))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 220)
                        .cornerRadius(14)
                    
                    VStack(alignment: .leading){
                        NavigationLink(movieTitle.title, value: movieTitle.id )
                            .font(.title)
                            .padding(.bottom)
                        HStack{
                            Text("Rating:")
                            Text("\(movieTitle.vote_average)")
                                .font(.body)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: MoviesDetailView.init)
            .navigationTitle("Trending Movies")
            .onAppear() {
                restAPI().getData(url: Constants.listOfMoviesApiEndpoint, type: Movies) { (movies) in self.movies = movies
                     }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

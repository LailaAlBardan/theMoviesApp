//
//  getMoviesModel.swift
//  theMoviesProject
//
//  Created by laila on 06/04/2023.
//

import Foundation

/* Model for the getter function and Structs to get the JSON Data. All variable names are self explanatory */
struct Details: Codable, Identifiable{
    var adult: Bool
    var backdrop_path: String?
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Float
    var poster_path: String
    var release_date: String
    var title: String
    var vote_average: Float
    var vote_count: Int
    
}
struct Movies: Codable{
    var page: Int
    var results: [Details]
    
}
struct MovieDetails: Codable{
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var original_title: String?
    var overview: String?
    var poster_path: String?
}
struct Constants {
    static let apiAuthKey: String = "?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let listOfMoviesApiEndpoint: String = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let movieDetailsApiEndpoint: String = "https://api.themoviedb.org/3/movie/"
    static let imageLink = "https://image.tmdb.org/t/p/w500"
}

class restAPI: ObservableObject{
    @Published var movies: Movies?
    
    func getData<T: Decodable>(url: String, type: T.Type, completion:@escaping (T) -> ()){
        guard let url = URL(string: url) else{
            print("invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            let movies = try! JSONDecoder().decode(T.self, from: data!)
            completion(movies)
        }.resume()
    }
}

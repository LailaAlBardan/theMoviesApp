//
//  getMoviesModel.swift
//  theMoviesProject
//
//  Created by laila on 06/04/2023.
//

import Foundation

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
    var id: Int
    var original_title: String
    var overview: String
    var poster_path: String
}
struct Constants {
    static let apiAuthKey: String = "c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let listOfMoviesApiEndpoint: String = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"
    static let movieDetailsApiEndpoint: String = "https://api.themoviedb.org/3/movie/"
    static let imageLink = "https://image.tmdb.org/t/p/w500"
}

class restAPI: ObservableObject{
    @Published var movies: Movies?
    let apiEndpoint = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"
    
    func getData<T: Decodable>(url: String, type: T, completion:@escaping (T) -> ()){
        guard let url = URL(string: apiEndpoint) else{
            print("invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            let movies = try! JSONDecoder().decode(n.self, from: data!)
            print(movies)
            DispatchQueue.main.async{
                completion(movies)
            }
        }.resume()
    }
    
}

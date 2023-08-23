//
//  MovieAPI.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import Foundation
import Alamofire

typealias MovieListAPIResponse = (Swift.Result<[Movie]?, DataError>) -> Void
var Movies : [Movie]  = []

// API interface to retrieve city

protocol MovieAPILogic {
    func getMovies(completion: @escaping (MovieListAPIResponse))
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) 
}

class MovieAPI: MovieAPILogic {



    func getMovies(completion: @escaping (MovieListAPIResponse)) {
        

        let headers: HTTPHeaders = [
            "Content-Type": "application/json; charset=utf-8",
        ]
       
        AF.request(Common.Global.List , method: .get, parameters: nil, encoding : URLEncoding.httpBody, headers: headers)
            .validate()
            .responseJSON
        { [self]
            response in
       
                
                switch response.result {
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                case .success(let value):
                if let JSON = value as? [String: Any] {
                if  JSON.count != 0{
                let results = JSON["results"] as? [[String: Any]]
                            results?.forEach{
                                
                do {
                    
                let jsonData = try JSONSerialization.data(withJSONObject: $0, options: [])
                    do {
                        let movie = try JSONDecoder().decode(Movie.self, from: jsonData)
                        
                        Movies.append(movie)
                                }
                    
                              catch {
                                  
                        print("Error decoding JSON: \(error)")
                        }}
                                
                                catch {
                        
                        print("Error converting dictionary to JSON data: \(error)")
                                    
                                    
                    }}
                       completion(.success(Movies))
                      
                        }
                        
                    }
                }
            }
    
 
        
    }
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
    
}

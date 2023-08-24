//
//  MockMovieAPI.swift
//  MovieTestTests
//
//  Created by Moez bachagha on 24/8/2023.
//

import Foundation
import UIKit
@testable import MovieTest


class MockMovieAPI: MovieAPILogic {
  
    var loadState: MoviesListLoadState = .empty
    
    
    func getMovies(completion: @escaping (MovieListAPIResponse)) {
        switch loadState {
        case .error:
            completion(.failure(.networkingError("Could not fetch Movies")))
        case .loaded:
            let mockMovie = Movie(id: 12, adult: false, original_language: "en", original_title: "test", overview: "test", poster_path: "test", release_date: "test", title: "test", vote_average: 12.12, vote_count: 120)
            completion(.success([mockMovie]))
        case .empty:
            completion(.success([]))
        }
    }
    

    func getMovieDetails(movieId : Int? , completion: @escaping (MovieDetailsAPIResponse)) {
        
        
        switch loadState {
        case .error:
            completion(.failure(.networkingError("Could not fetch Movie details")))
        case .loaded:
            let mockMovieDetails = Movie(id: 12, adult: false, original_language: "en", original_title: "test", overview: "test", poster_path: "test", release_date: "test", title: "test", vote_average: 12.12, vote_count: 120)
            completion(.success(mockMovieDetails))
        case .empty:
            completion(.success(nil))
        }
    }
    
    
    
    
    
    
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        switch loadState {
        case .error:
            print(DataError.networkingError("Could not fetch Movie details"))
        case .loaded:
            print(DataError.networkingError("Could not fetch Movie details"))
        case .empty:
            print(DataError.networkingError("Could not fetch Movie details"))
        }
    }
        
    

}

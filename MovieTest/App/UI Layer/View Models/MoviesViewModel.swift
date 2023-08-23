//
//  MoviesViewModel.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import Foundation
import UIKit

class MoviesViewModel {
    
private(set) var Movies: [Movie] = []
private(set) var error: DataError? = nil

private let apiService: MovieAPILogic

    init(apiService: MovieAPILogic = MovieAPI()) {
        self.apiService = apiService
    }
    
    
func getMovies(completion: @escaping( ([Movie]?, DataError?) -> () ) ) {
    apiService.getMovies { [weak self] result in
        
        switch result {
        case .success(let Movies):
            self?.Movies = Movies ?? []
            completion(Movies, nil)
        case .failure(let error):
            self?.error = error
            completion(nil, error)
        }
    }
}
    
    func getImage(from url: URL, completion: @escaping( (UIImage?)?, DataError?) -> () )  {
        apiService.downloadImage (from : url,
            completion: { [weak self] result in
            if let image = result {
                completion(image, nil)
                    }
            else {
                
                completion(nil, DataError.invalidData)
            }
        }
        )
    }
    
}

//
//  Movie.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import Foundation

struct Movie: Decodable {
    
    
    
       
        let id: Int?
        let adult: Bool?
        let original_language: String?
        let original_title: String?
        let overview: String?
        let poster_path: String?
        let release_date: String?
        let title: String?
        let vote_average: Double?
        let vote_count: Int?

        
     
        
        enum CodingKeys: String, CodingKey {
            case id
            case adult
            case original_language
            case original_title
            case overview
            case poster_path
            case release_date
            case title
            case vote_average
            case vote_count
            
        
    }
    }


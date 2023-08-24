//
//  MovieDetailsViewController.swift
//  MovieTest
//
//  Created by Moez bachagha on 24/8/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var MoviesViewModel: MoviesViewModel!

    
    
    @IBOutlet weak var movieImg: UIImageView!
    
    @IBOutlet weak var titleTxt: UILabel!
    
    @IBOutlet weak var dateTxt: UILabel!
    
    @IBOutlet weak var rateTxt: UILabel!
    
    @IBOutlet weak var descriptionTxt: UITextView!
    var movieId : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesViewModel = MovieTest.MoviesViewModel()
        MoviesViewModel.getMovieDetails(movieId : movieId , completion :{ [weak self] (Movie, error)  in

          if let error = error {
              
            
        }
        
        if let movie = Movie {
            
            self!.titleTxt.text = movie.title
            self!.dateTxt.text = movie.release_date
            self!.rateTxt.text =  String(movie.vote_average!)
            self!.descriptionTxt.text = movie.overview
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + movie.poster_path!) {
                self!.MoviesViewModel.getImage(from : imageURL , completion: { [weak self] (image, error) in
                if let error = error {
                   
                }
                
                if let image = image {
                    DispatchQueue.main.async() { [weak self] in
                        self!.movieImg.image = image
                        self!.movieImg.contentMode = .scaleAspectFill
                        self!.movieImg.backgroundColor = UIColor.lightGray
                        self!.movieImg.layer.cornerRadius = 10
                        self!.movieImg.clipsToBounds = true
                        self!.movieImg.layer.shadowColor = UIColor.black.cgColor
                        self!.movieImg.layer.shadowOpacity = 0.5
                        self!.movieImg.layer.shadowOffset = CGSize(width: 4, height: 4)
                        self!.movieImg.layer.masksToBounds = false
                        self!.movieImg.layer.shadowRadius = 5.0
                    
                    } }})
                
            }


            
        }
    })
    


}
        }

//
//  ViewController.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var MoviesViewModel: MoviesViewModel!
    var MoviesArray: [Movie] = []

    @IBOutlet weak var MoviesTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoviesViewModel = MovieTest.MoviesViewModel()
        MoviesViewModel.getMovies { [weak self] (Movies, error) in
            if let error = error {
               
            }
            
            if let Movies = Movies {
                
                self?.MoviesArray = Movies
                self?.MoviesTable.reloadData()


                
            }
            print("retrieved \(self!.MoviesArray.count) Movies")

        }
    }
}
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
                    return MoviesArray.count
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let content = cell.viewWithTag(0)
        let movieImg = content!.viewWithTag(1) as! UIImageView
        let movieName = content!.viewWithTag(2) as! UILabel
        let movieDate = content!.viewWithTag(3) as! UILabel
        let Movie = MoviesArray[indexPath.row]
        movieName.text = Movie.title
        movieDate.text = Movie.release_date
        
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + Movie.poster_path!) {
        MoviesViewModel.getImage(from : imageURL , completion: { [weak self] (image, error) in
            if let error = error {
               
            }
            
            if let image = image {
                DispatchQueue.main.async() { [weak self] in
                movieImg.image = image
                
                } }})
            
        }
                                 
                  return cell
    }
                                 
                                 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
  /*
        let cities = citiesArray[indexPath.row]
        
   

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CityDetailsViewController") as! CityDetailsViewController
        controller.city  = cityModel
        self.navigationController?.pushViewController(controller, animated:true)
*/

      }

}


//
//  MovieGridDetailViewController.swift
//  Flix
//
//  Created by Jackson Tran on 3/4/22.
//

import UIKit

class MovieGridDetailViewController: UIViewController {

    @IBOutlet weak var movieBackDrop: UIImageView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTitle.text = movie.name
        movieTitle.sizeToFit()
        movieDescription.text = movie.description
        movieDescription.sizeToFit()
        let posterBaseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie.poster_path
        let posterUrl = URL(string: posterBaseUrl + posterPath)
        moviePoster.af.setImage(withURL: posterUrl!)
        
        let backdropBaseUrl = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie.backdrop_path
        let backdropUrl = URL(string: backdropBaseUrl + backdropPath)
        movieBackDrop.af.setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

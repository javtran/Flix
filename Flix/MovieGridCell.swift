//
//  MovieGridCell.swift
//  Flix
//
//  Created by Jackson Tran on 3/3/22.
//

import UIKit
import AlamofireImage

class MovieGridCell: UICollectionViewCell {
    
    @IBOutlet weak var posterView: UIImageView!
    
    func configureMovieGrid (with movie: Movie) {
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie.poster_path
        let posterUrl = URL(string: baseUrl + posterPath)
        posterView.af.setImage(withURL: posterUrl!)
    }
}

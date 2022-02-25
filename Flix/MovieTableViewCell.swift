//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Jackson Tran on 2/22/22.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!

    func configure (with movie: Movie) {
        movieNameLabel.text = movie.name
        movieDescriptionLabel.text = movie.description
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie.poster_path
        let posterUrl = URL(string: baseUrl + posterPath)
        movieImageView.af.setImage(withURL: posterUrl!)
    }
}

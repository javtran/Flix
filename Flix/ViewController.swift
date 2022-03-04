//
//  ViewController.swift
//  Flix
//
//  Created by Jackson Tran on 2/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    private var movies = [Movie]() {
        didSet {
            movieTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
        MovieService.shared.fetchMovies(url: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed") {movies in
            self.movies = movies
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
     */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureMovieTable(with: movies[indexPath.row])
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = movieTableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        // Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        
        movieTableView.deselectRow(at: indexPath, animated: true)
    }
}


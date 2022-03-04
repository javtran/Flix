//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Jackson Tran on 3/3/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [Movie]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        MovieService.shared.fetchMovies(url: "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed") {
            movies in self.movies = movies
        }
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        cell.configureMovieGrid(with: movies[indexPath.item])
        return cell
    }

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let movie = movies[indexPath.item]
        // Pass the selected object to the new view controller.
        let detailsViewController = segue.destination as! MovieGridDetailViewController
        detailsViewController.movie = movie
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    

}

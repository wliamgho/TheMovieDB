//
//  MovieListViewController.swift
//  MovieDB
//
//  Created by William on 22/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, MovieListDelegate {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  private var data: MovieModel?

  var viewModel: MovieListViewModel?

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    activityIndicator.startAnimating()
    activityIndicator.isHidden = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = MovieListViewModel(path: .nowPlaying)
    viewModel?.delegate = self

    collectionView.register(UINib(nibName: MovieItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieItemCell.reuseIdentifier())
  }

  func failedLoad(error: String) {
    // Error actions
  }

  func successLoad(data: MovieModel) {
    activityIndicator.stopAnimating()
    activityIndicator.isHidden = true
    
    self.data = data

    self.collectionView.reloadData()
  }
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.data?.movies.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieItemCell.reuseIdentifier(), for: indexPath) as? MovieItemCell else {
      return UICollectionViewCell()
    }

    let movies = self.data?.movies[indexPath.row]

    cell.imageUrl = movies?.posterPath
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewSize = collectionView.frame.width - 2
    
    return CGSize(width: collectionViewSize / 2 - 1 / 2,
                  height: collectionViewSize / 2 + 80)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}

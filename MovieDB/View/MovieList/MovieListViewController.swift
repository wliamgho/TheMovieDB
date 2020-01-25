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

  private var data: MovieModel?

  var viewModel: MovieListViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = MovieListViewModel(path: .nowPlaying)
    viewModel?.delegate = self

    collectionView.register(UINib(nibName: MovieItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieItemCell.reuseIdentifier())
  }

  func failedLoad(error: String) {
    
  }

  func successLoad(data: MovieModel) {
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

    cell.backgroundColor = .lightGray
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let padding: CGFloat = 50

    let collectionViewSize = collectionView.frame.size.width - padding
    
    return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}

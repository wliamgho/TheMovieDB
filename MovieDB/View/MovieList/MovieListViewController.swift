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

  var viewModel: MovieListViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = MovieListViewModel(path: .nowPlaying)
    viewModel?.delegate = self
  }

  func failedLoad(error: String) {
    debugPrint("HERE ERROR")
  }
  
  func successLoad(data: MovieModel) {
    debugPrint("SUCCESS LOAD", data)
  }
}


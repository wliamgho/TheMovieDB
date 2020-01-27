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
  var dropMenuItem: UIBarButtonItem!

  private var data: MovieModel?

  var viewModel: MovieListViewModel?
  private var dropDownButton: DropDownButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setDropDownMenu()

    viewModel = MovieListViewModel(path: .nowPlaying)
    viewModel?.delegate = self

    collectionView.register(UINib(nibName: MovieItemCell.reuseIdentifier(), bundle: nil),
                            forCellWithReuseIdentifier: MovieItemCell.reuseIdentifier())
  }

  private func setDropDownMenu() {
    dropDownButton = DropDownButton(type: .system)
    dropDownButton.frame = CGRect.zero
    dropDownButton.setTitleColor(.blue, for: .normal)
    dropDownButton.setTitle("Layout", for: .normal)
    dropDownButton.clipsToBounds = true
    dropDownButton.translatesAutoresizingMaskIntoConstraints = false

    dropDownButton.dropView.options = ["List", "Columns"]

    dropMenuItem = UIBarButtonItem(customView: dropDownButton)
//    self.navigationItem.rightBarButtonItem = dropMenuItem
    self.navigationItem.setRightBarButton(dropMenuItem, animated: true)
  }

  // Delegate method
  func failedLoad(error: String) {
    // Error actions
  }

  func successLoad(data: MovieModel) {
    self.data = data

    self.collectionView.reloadData()
  }

  func isLoading(status: Bool) {
    if status == true {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }

    activityIndicator.isHidden = !status
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

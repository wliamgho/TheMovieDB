//
//  MovieItemCell.swift
//  MovieDB
//
//  Created by William on 25/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class MovieItemCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!

  var imageUrl: String? {
    didSet {
      didSetMovieImage()
    }
  }

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code

    imageView.backgroundColor = .lightGray
  }

  private func didSetMovieImage() {
    guard let imageUrl = imageUrl else { return }

    let url = URL(string: imageUrl)

    imageView.backgroundColor = .clear
    imageView.loadImage(url: url)
  }
}

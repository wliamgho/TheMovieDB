//
//  MovieItemCell.swift
//  MovieDB
//
//  Created by William on 25/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class MovieItemCell: UICollectionViewCell {

  static func reuseIdentifier() -> String {
    return String(describing: self)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
}

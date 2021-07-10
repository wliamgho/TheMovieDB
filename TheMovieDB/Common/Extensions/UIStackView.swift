//
//  UIStackView.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ view: UIView...) -> Void {
        view.forEach {
            self.addArrangedSubview($0)
        }
    }
}

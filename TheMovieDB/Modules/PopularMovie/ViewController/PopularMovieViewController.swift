//
//  PopularMovieViewController.swift
//  TheMovieDB
//
//  Created by William on 13/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

class PopularMovieViewController: ViewController {
    var viewModel: PopularMovieViewModel
    init(viewModel: PopularMovieViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupUI() {    
    }

    override func bindViewModel() {
    }
}

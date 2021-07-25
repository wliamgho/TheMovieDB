//
//  BaseViewController.swift
//  TheMovieDB
//
//  Created by William on 13/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewControllerBinder: AnyObject {
    func bindViewModel()
    func setupUI()
}

class ViewController: UIViewController, ViewControllerBinder {
    lazy var disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel() {
        Log.error("BindViewModel should override")
    }
    
    func setupUI() {
        Log.error("SetupUI should override")
    }
    
    override func viewDidLoad() {
        bindViewModel()
        setupUI()
    }
}

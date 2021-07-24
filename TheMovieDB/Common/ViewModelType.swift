//
//  ViewModel.swift
//  TheMovieDB
//
//  Created by William on 05/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

protocol ViewModelType: AnyObject {
    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output
}

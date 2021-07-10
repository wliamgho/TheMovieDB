//
//  FormButton.swift
//  TheMovieDB
//
//  Created by William on 10/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import UIKit

class FormButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? .systemBlue : .lightGray
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.systemGray, for: .disabled)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        self.layer.cornerRadius = 16
    }
}

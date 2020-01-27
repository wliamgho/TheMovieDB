//
//  DropDownButton.swift
//  MovieDB
//
//  Created by William on 27/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

class DropDownButton: UIButton {
  var dropView: DropDownView!

  private(set) var height = NSLayoutConstraint()
  private(set) var isOpen = false

  override init(frame: CGRect) {
    super.init(frame: frame)

    loadDropView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func didMoveToSuperview() {
    self.superview?.addSubview(dropView)
    self.superview?.bringSubviewToFront(dropView)
    
    dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    height = dropView.heightAnchor.constraint(equalToConstant: 0)
  }

  private func loadDropView() {
    dropView = DropDownView(frame: .zero)
    dropView.delegate = self
    dropView.translatesAutoresizingMaskIntoConstraints = false
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if isOpen == false {
      isOpen = true
      
      NSLayoutConstraint.deactivate([self.height])

      if self.dropView.tableView.contentSize.height > 150 {
        self.height.constant = 150
      } else {
        self.height.constant = self.dropView.tableView.contentSize.height
      }

      NSLayoutConstraint.activate([self.height])
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
        self.dropView.layoutIfNeeded()
        self.dropView.center.y += self.dropView.frame.height / 2
      }, completion: nil)
      
    } else {
      isOpen = false
      
      NSLayoutConstraint.deactivate([self.height])
      self.height.constant = 0
      NSLayoutConstraint.activate([self.height])
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
        self.dropView.center.y -= self.dropView.frame.height / 2
        self.dropView.layoutIfNeeded()
      }, completion: nil)

    }
  }
  
  private func dismissDropMenu() {
    isOpen = false

    NSLayoutConstraint.deactivate([self.height])
    self.height.constant = 0
    NSLayoutConstraint.activate([self.height])
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
      self.dropView.center.y -= self.dropView.frame.height / 2
      self.dropView.layoutIfNeeded()
    }, completion: nil)

  }
}

extension DropDownButton: DropDownDelegate {
  // MARK: - DropDownDelegate
  func dropDownItemTapped(string: String) {
    self.setTitle(string, for: .normal)
    self.dismissDropMenu()
  }
}

//
//  DropDownView.swift
//  MovieDB
//
//  Created by William on 27/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

protocol DropDownDelegate: class {
  func dropDownItemTapped(string: String)
}

final class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
  var tableView = UITableView()
  var options = [String]()

  weak var delegate: DropDownDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)

    loadView()
  }

  convenience init(options: [String]) {
    self.init(frame: CGRect.zero)

    self.options = options
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func loadView() {
    tableView.delegate = self
    tableView.dataSource = self

    tableView.translatesAutoresizingMaskIntoConstraints = false
	
    self.addSubview(tableView)
    
    tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }

  // MARK: - UITableViewDelegate, UITableViewDataSource
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return options.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = options[indexPath.row]
    cell.selectionStyle = .none
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)

    self.delegate?.dropDownItemTapped(string: options[indexPath.row])
  }
}

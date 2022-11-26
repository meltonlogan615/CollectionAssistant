//
//  MainViewController.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import UIKit

class MainViewController: UIViewController {
  
  let colorView = ColorSelectionView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
  
  
}

extension MainViewController {
  
  func style() {
    colorView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      colorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

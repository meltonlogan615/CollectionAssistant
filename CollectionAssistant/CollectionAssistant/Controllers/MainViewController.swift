//
//  MainViewController.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import UIKit

class MainViewController: UIViewController {
  
  let gridView = GridCollectionView()
  let colorView = ColorSelectionView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    style()
    layout()
  }
  
  
}

extension MainViewController {
  
  func style() {
    gridView.translatesAutoresizingMaskIntoConstraints = false
    gridView.backgroundColor = .black
    colorView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(gridView)
    NSLayoutConstraint.activate([
      gridView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      gridView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      gridView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      gridView.widthAnchor.constraint(equalToConstant: (view.frame.width * 0.66))
    ])
    
    view.addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      colorView.leadingAnchor.constraint(equalTo: gridView.trailingAnchor),
      
      colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      colorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

//
//  GridCollectionView.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/27/22.
//

import Foundation
import UIKit

class GridCollectionView: UIView {
  
  var collection: UICollectionView!
  let layoutCollection = UICollectionViewLayout()

  override init(frame: CGRect) {
    super.init(frame: frame)
    collection = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewLayout())
    collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension GridCollectionView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    collection.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    addSubview(collection)
    NSLayoutConstraint.activate([
      collection.topAnchor.constraint(equalTo: topAnchor),
      collection.leadingAnchor.constraint(equalTo: leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: trailingAnchor),
      collection.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

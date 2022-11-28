//
//  GridCollectionView.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/27/22.
//

import Foundation
import UIKit

class GridCollectionView: UIView {
  
  var colors: [UIColor]!
  var collection: UICollectionView!
  let layoutCollection = UICollectionViewLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    collection = UICollectionView(frame: self.frame, collectionViewLayout: layoutCollection)
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
      collection.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      collection.leadingAnchor.constraint(equalTo: leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: trailingAnchor),
      bottomAnchor.constraint(equalToSystemSpacingBelow: collection.bottomAnchor, multiplier: 2)
    ])
  }
}

extension GridCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    return cell
  }
}

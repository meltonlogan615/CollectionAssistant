//
//  OutputModel.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 12/2/22.
//

import Foundation

struct Output {
  var collectionGroup: CollectionGroup
  var itemsReceived: [CollectionItem]
  var preparedItems: [String]
  
  mutating func generateItemsAndSizes() {
    for i in 0 ..< itemsReceived.count {
      let sizedItem =
        "let item\(i)Size = NSCollectionLayoutSize(widthDimension:.fractionalWidth(\(itemsReceived[i].width)),heightDimension: .fractionalHeight(\(itemsReceived[i].height))"
      print(sizedItem)
      preparedItems.append(sizedItem)
      
      let configuredItem = "let item\(i) = NSCollectionLayoutItem(layoutSize: item\(i)Size)"
      print(configuredItem)
      preparedItems.append(sizedItem)
    }
  }
  
  func generateOutput() {
    print(createCompositionalLayout)
  }
  // this method doesn't require much if any editing when converted into a string
  var createCompositionalLayout = """
  func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { _,_ in
      return self.createGroup()
    }
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 8
    layout.configuration = config
    return layout
  }
"""
  
  var createGroup = """
  func createGroup() -> NSCollectionLayoutSection {
    let rowHeight = CGFloat(1/oneViewModel.rowCount)
    let columnWidth = CGFloat(1/oneViewModel.colCount)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1))
    
    let sectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(rowHeight))
"""
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(columnWidth),
                                          heightDimension: .fractionalHeight(1))

    let item = NSCollectionLayoutItem(layoutSize: itemSize)
"""
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                   subitems: [item])
    
    let sectionAssembly = NSCollectionLayoutGroup.vertical(layoutSize: sectionSize,
                                                           subitems: [group])
    
    let section = NSCollectionLayoutSection(group: sectionAssembly)
    return section
  }
"""
}



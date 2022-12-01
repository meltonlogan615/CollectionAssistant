//
//  ColorViewModel.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/28/22.
//

import Foundation
import UIKit

class ColorViewModel {
//  let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemPurple, .black, .clear]
  var colors: [UIColor]!
  var currentColor = UIColor()
  var buttonStack: UIStackView!
  var collection: UICollectionView!
  
  func setColorButtonActions() {
    for item in buttonStack.arrangedSubviews {
      guard let item = item as? UIButton else { return }
      item.addTarget(self, action: #selector(colorSelected), for: .touchUpInside)
    }
  }
  
  func clearAllCells(in collection: UICollectionView) {
    for cell in collection.visibleCells {
      cell.backgroundColor = nil
    }
  }
  
  @objc
  func colorSelected(_ sender: UIButton) {
    self.currentColor = colors[sender.tag]
    sender.isHighlighted = true
    switch self.currentColor {
      case .clear:
        clearAllCells(in: collection)
        deselectButtons()
        sender.isHighlighted = false
        //      items.removeAll()
      default:
        deselectButtons()
        sender.layer.borderWidth = 5
        sender.layer.borderColor = colors[sender.tag].cgColor
        sender.isSelected = true
    }
    print(String(describing: currentColor))
//    currentColor = colors[sender.tag]
  }
  
  func deselectButtons() {
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      if button.isSelected {
        button.layer.borderWidth = 0.5
        button.isSelected = false
      }
    }
  }
}

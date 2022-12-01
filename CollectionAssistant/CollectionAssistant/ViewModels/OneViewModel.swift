//
//  OneViewModel.swift To Rule Them All
//  CollectionAssistant
//
//  Created by Logan Melton on 12/1/22.
//

import Foundation
import UIKit

class OneViewModel {
  // MARK: - Grid Props
  var rowCount = CGFloat(4)
  var colCount = CGFloat(4)
  
  // MARK: - Color Props
  var colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemPurple, .label, .clear]
  var currentColor = UIColor()
  var colorStack: UIStackView!
  var collection: UICollectionView!
  
  // MARK: - Add / Remove Methods
  func setAddRemoveActions(for buttonStack: UIStackView) {
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      switch button.tag {
        case 0:
          button.addTarget(self, action: #selector(addRow), for: .touchUpInside)
        case 1:
          button.addTarget(self, action: #selector(removeRow), for: .touchUpInside)
        case 2:
          button.addTarget(self, action: #selector(addColumn), for: .touchUpInside)
        case 3:
          button.addTarget(self, action: #selector(removeColumn), for: .touchUpInside)
        default:
          print("sod off")
      }
    }
  }
  
  @objc
  func addRow() {
    clearAllCells(in: collection)
    rowCount += 1
    collection.reloadData()
  }
  
  @objc
  func removeRow() {
    clearAllCells(in: collection)
    if rowCount > 1 {
      rowCount -= 1
      collection.reloadData()
    } else {
      return
    }
  }
  
  @objc
  func addColumn() {
    clearAllCells(in: collection)
    colCount += 1
    collection.reloadData()
  }
  
  @objc
  func removeColumn() {
    clearAllCells(in: collection)
    if colCount > 1 {
      colCount -= 1
      collection.reloadData()
    } else {
      return
    }
  }
  
  // MARK: - Grid methods
  // Currently, none.
  
  // MARK: - Color Selection Methods
  func setColorButtonActions() {
    for item in colorStack.arrangedSubviews {
      guard let item = item as? UIButton else { return }
      item.addTarget(self, action: #selector(colorSelected), for: .touchUpInside)
    }
  }
  
  func deselectButtons() {
      for button in colorStack.arrangedSubviews {
        guard let button = button as? UIButton else { return }
        if button.isSelected {
          button.layer.borderWidth = 0.5
          button.isSelected = false
        }
      }
    }
  
  func clearAllCells(in collection: UICollectionView) {
    for cell in collection.visibleCells {
      cell.backgroundColor = nil
    }
  }
  
  @objc
  func colorSelected(_ sender: UIButton) {
    deselectButtons()
    self.currentColor = colors[sender.tag]
    sender.isHighlighted = true
    switch self.currentColor {
      case .clear:
        clearAllCells(in: collection)
        sender.isHighlighted = false
      default:
        sender.layer.borderWidth = 5
        sender.layer.borderColor = colors[sender.tag].cgColor
        sender.isSelected = true
    }
  }
  

  
  // MARK: - Undo / ReDo methods
  func setUndoRedoButtons(for buttonStack: UIStackView) {
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      switch button.tag {
        case 1:
          button.addTarget(self, action: #selector(undoLastAction), for: .touchUpInside)
        case 2:
          button.addTarget(self, action: #selector(redoLastAction), for: .touchUpInside)
        default:
          print("sod off")
      }
    }
  }
  
  @objc
  func undoLastAction() {
    print("undone")
  }
  
  @objc
  func redoLastAction() {
    print("redone")
  }
}

//
//  AddRemoveViewModel.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/29/22.
//

import Foundation
import UIKit

class AddRemoveViewModel {
  func setButtonActions(for buttonStack: UIStackView) {
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      switch button.tag {
        case 0:
          print("fart 1")
          button.addTarget(self, action: #selector(addRow), for: .touchUpInside)
        case 1:
          print("fart 2")
          button.addTarget(self, action: #selector(removeRow), for: .touchUpInside)
        case 2:
          print("fart 2")
          button.addTarget(self, action: #selector(addColumn), for: .touchUpInside)
        case 3:
          print("fart 2")
          button.addTarget(self, action: #selector(removeColumn), for: .touchUpInside)
        default:
          print("sod off")
      }
      
    }
  }
  
  @objc
  func addRow() {
    print("added row")
  }
  @objc
  func removeRow() {
    print("removed row")
  }
  @objc
  func addColumn() {
    print("added column")
  }
  @objc
  func removeColumn() {
    print("removed column")
  }
}

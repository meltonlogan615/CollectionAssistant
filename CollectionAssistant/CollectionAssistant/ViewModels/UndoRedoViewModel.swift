//
//  UndoRedoViewModel.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/29/22.
//

import Foundation
import UIKit

class UndoRedoViewModel {
  
  func setButtonActions(for buttonStack: UIStackView) {
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      switch button.tag {
        case 1:
          print("fart 1")
          button.addTarget(self, action: #selector(undoLastAction), for: .touchUpInside)
        case 2:
          print("fart 2")
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

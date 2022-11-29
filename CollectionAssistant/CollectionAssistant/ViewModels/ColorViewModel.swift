//
//  ColorViewModel.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/28/22.
//

import Foundation
import UIKit

class ColorViewModel {
  var currentColor = UIColor()
//  var buttonStack: UIStackView!
  
  func setColorButtonActions(for buttonStack: UIStackView) {
    for item in buttonStack.arrangedSubviews {
      print("poop")
      guard let item = item as? UIButton else { return }
      item.addTarget(self, action: #selector(colorSelected), for: .touchUpInside)
    }
  }
  
  @objc
  func colorSelected(_ sender: UIButton) {
    print("\(String(describing: sender.currentTitle))")
  }
}

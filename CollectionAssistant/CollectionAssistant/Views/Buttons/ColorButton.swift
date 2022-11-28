//
//  ColorButton.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class ColorButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.borderWidth = 2
    layer.cornerRadius = 8
    clipsToBounds = true
  }
}

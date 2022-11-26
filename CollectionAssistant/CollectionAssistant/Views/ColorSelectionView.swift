//
//  ColorSelectionView.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class ColorSelectionView: UIView {
  
  let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemPurple, .label, .clear]
  var colorStack = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ColorSelectionView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    colorStack.translatesAutoresizingMaskIntoConstraints = false
    colorStack.axis = .vertical
    colorStack.distribution = .fillEqually
  }
  
  func layout() {
    addSubview(colorStack)
    NSLayoutConstraint.activate([
      colorStack.topAnchor.constraint(equalTo: topAnchor),
      colorStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      colorStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      colorStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    for color in colors {
      let button = UIButton()
      button.backgroundColor = color
      switch color {
        case .systemRed:
          button.setTitle("Red", for: [])
        default:
          button.setTitle("FART", for: [])
      }
      colorStack.addArrangedSubview(button)
    }
  }
}

//
//  ColorSelectionView.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class ColorSelectionView: UIView {
  var colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemPurple, .label, .clear]

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
    colorStack.spacing = 8
  }
  
  func layout() {
    addSubview(colorStack)
    NSLayoutConstraint.activate([
      colorStack.topAnchor.constraint(equalTo: topAnchor),
      colorStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      colorStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      colorStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    var tagNumber = 0
    for color in colors {
      let button = ColorButton(bg: color)
      button.tag = tagNumber
      switch color {
        case .systemRed:
          button.setTitle("Red", for: [])
          
        case .systemOrange:
          button.setTitle("Orange", for: [])

        case .systemYellow:
          button.setTitle("Yellow", for: [])

        case .systemGreen:
          button.setTitle("Green", for: [])

        case .systemBlue:
          button.setTitle("Blue", for: [])

        case .systemPurple:
          button.setTitle("Purple", for: [])

        case .label:
          button.setTitle("Label", for: [])
          var config = UIButton.Configuration.bordered()
          config.baseForegroundColor = .systemBackground
          config.baseBackgroundColor = .label
          config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .preferredFont(forTextStyle: .largeTitle)
            return outgoing
          }
          button.configuration = config
//          button.setTitleColor(UIColor.systemBackground, for: [])
          
        case .clear:
          button.setTitle("Clear All", for: [])
          var config = UIButton.Configuration.bordered()
          config.baseForegroundColor = .label
          config.baseBackgroundColor = .systemBackground
          config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .preferredFont(forTextStyle: .largeTitle)
            return outgoing
          }
          button.configuration = config
          button.layer.borderColor = UIColor.label.cgColor
          
        default:
          button.setTitle("fart", for: [])

      }
      tagNumber += 1
      colorStack.addArrangedSubview(button)
    }
  }
}

//
//  ActionButtons.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/28/22.
//

import Foundation
import UIKit

class ActionButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: 56).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(name: AttributedString) {
    self.init()
    layer.cornerRadius = 8
    clipsToBounds = true
    var config = UIButton.Configuration.filled()
    config.baseForegroundColor = .systemBackground
    config.baseBackgroundColor = .systemGray
    config.imagePadding = 4
    config.titlePadding = 4
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .title1)
      return outgoing
    }
    config.attributedTitle = name
    switch name {
      case "Undo":
        setImage(UIImage(systemName: "gobackward"), for: [])
        tag = 1
      case "Redo":
        setImage(UIImage(systemName: "goforward"), for: [])
        tag = 2
      default:
        tag = 3
    }
    self.configuration = config
  }
}




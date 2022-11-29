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
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 80
    clipsToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(bg: UIColor) {
    self.init()
    self.layer.borderWidth = 4
    self.layer.borderColor = bg.cgColor


    var config = UIButton.Configuration.filled()
    config.baseForegroundColor = .white
    config.baseBackgroundColor = bg
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .largeTitle)
      return outgoing
    }
    self.configuration = config
  }
}

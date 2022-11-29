//
//  ColorButton.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class ColorButton: UIButton {
  var color: UIColor!
  
  override init(frame: CGRect) {
    super.init(frame: frame)

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(bg: UIColor) {
    self.init()
    translatesAutoresizingMaskIntoConstraints = false
    var config = UIButton.Configuration.bordered()
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .largeTitle)
      return outgoing
    }
    config.baseForegroundColor = .label
    config.baseBackgroundColor = bg
    layer.cornerRadius = 8
    clipsToBounds = true
    layer.borderWidth = 4
    layer.borderColor = bg.cgColor
    
    configuration = config
  }
}

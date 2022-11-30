//
//  AddButton.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class AddButton: UIButton {
  var name = AttributedString()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  convenience init(name: AttributedString) {
    self.init()
//    self.name = name
    self.layer.cornerRadius = 8
    self.clipsToBounds = true
    var config = UIButton.Configuration.filled()
    config.titlePadding = 4
    config.imagePadding = 4
    config.attributedTitle = name
    config.baseForegroundColor = UIColor.systemBackground
    config.baseBackgroundColor = UIColor.link
    config.imagePadding = 8
    config.image = UIImage(systemName: "plus")
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .title2)
      return outgoing
    }
    self.configuration = config
  }
}



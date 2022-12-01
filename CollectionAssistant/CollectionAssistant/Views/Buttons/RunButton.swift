//
//  RunButton.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 12/1/22.
//

import UIKit

class RunButton: UIButton {
  var name = AttributedString()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.cornerRadius = 8
    self.clipsToBounds = true
    var config = UIButton.Configuration.filled()
    config.titlePadding = 4
    config.imagePadding = 4
    config.attributedTitle = "Run"
    config.baseForegroundColor = UIColor.systemBackground
    config.baseBackgroundColor = UIColor.systemMint
    config.imagePadding = 8
    config.image = UIImage(systemName: "play")
    config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
      var outgoing = incoming
      outgoing.font = .preferredFont(forTextStyle: .title1)
      return outgoing
    }
    self.configuration = config
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

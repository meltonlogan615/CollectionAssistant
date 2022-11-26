//
//  RemoveButton.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import Foundation
import UIKit

class RemoveButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    setImage(UIImage(systemName: "minus"), for: [])
    
    //    var config =
    //
    //    self.configuration = config
  }
}

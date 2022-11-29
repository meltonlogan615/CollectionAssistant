//
//  AddRemoveStack.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/28/22.
//

import Foundation
import UIKit

class AddRemoveStack: UIView {
  var addRowButton = AddButton(name: "Add Row")
  var removeRowButton = RemoveButton(name: "Remove Row")
  var addColButton = AddButton(name: "Add Col")
  var removeColButton = RemoveButton(name: "Remove Col")
  var buttonStack = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    buttonStack.axis = .horizontal
    buttonStack.distribution = .fillEqually
    buttonStack.spacing = 8
    buttonStack.addArrangedSubview(addRowButton)
    buttonStack.addArrangedSubview(removeRowButton)
    buttonStack.addArrangedSubview(addColButton)
    buttonStack.addArrangedSubview(removeColButton)
    addSubview(buttonStack)
    
    var tagNumber = 0
    for button in buttonStack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      button.tag = tagNumber
      tagNumber += 1
    }
    
    NSLayoutConstraint.activate([
      buttonStack.topAnchor.constraint(equalTo: topAnchor),
      buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      buttonStack.heightAnchor.constraint(equalToConstant: 56)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

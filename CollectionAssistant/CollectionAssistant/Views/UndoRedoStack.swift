//
//  UndoRedoStack.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/28/22.
//

import Foundation
import UIKit

class UndoRedoStack: UIView {
  let undoButton = ActionButton(name: "Undo")
  let redobutton = ActionButton(name: "Redo")
  let newGroupButton = ActionButton(name: "newGroup")
  let buttonStack = UIStackView()
  
  let run = RunButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    run.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(run)
    NSLayoutConstraint.activate([
      run.topAnchor.constraint(equalTo: topAnchor),
      run.leadingAnchor.constraint(equalTo: leadingAnchor),
      run.trailingAnchor.constraint(equalTo: trailingAnchor),
      run.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
//    undoButton.translatesAutoresizingMaskIntoConstraints = false
//    redobutton.translatesAutoresizingMaskIntoConstraints = false
//
//    buttonStack.translatesAutoresizingMaskIntoConstraints = false
//    buttonStack.axis = .horizontal
//    buttonStack.spacing = 4
//    buttonStack.distribution = .fillEqually
//
//    buttonStack.addArrangedSubview(undoButton)
//    buttonStack.addArrangedSubview(redobutton)
//
//    addSubview(buttonStack)
//    NSLayoutConstraint.activate([
//      buttonStack.topAnchor.constraint(equalTo: topAnchor),
//      buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor),
//      buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//      buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor),
//    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}



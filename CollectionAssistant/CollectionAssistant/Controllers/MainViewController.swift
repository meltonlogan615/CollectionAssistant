//
//  MainViewController.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import UIKit

class MainViewController: UIViewController {
  
  let addRemoveStack = AddRemoveStack()
  var gridView: GridCollectionView! {
    didSet {
      gridView.collection.dataSource = self
      gridView.collection.delegate = self
      gridView.collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
  }
  
  let undoRedo = UndoRedoStack()
  let colorView = ColorSelectionView()
  
  lazy var addRemoveViewModel: AddRemoveViewModel = {
    AddRemoveViewModel()
  }()

  lazy var gridViewModel: GridViewModel = {
    GridViewModel()
  }()
  
  lazy var undoRedoViewModel: UndoRedoViewModel = {
    UndoRedoViewModel()
  }()
  
  lazy var colorViewModel: ColorViewModel = {
    ColorViewModel()
  }()
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    gridView = GridCollectionView()
    addRemoveViewModel.setButtonActions(for: addRemoveStack.buttonStack)
    undoRedoViewModel.setButtonActions(for: undoRedo.buttonStack)
    colorViewModel.setColorButtonActions(for: colorView.colorStack)

    style()
    layout()
  }
}

extension MainViewController {
  func style() {
    addRemoveStack.translatesAutoresizingMaskIntoConstraints = false
    gridView.translatesAutoresizingMaskIntoConstraints = false
    gridView.collection.backgroundColor = .red
    undoRedo.translatesAutoresizingMaskIntoConstraints = false
    colorView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(addRemoveStack)
    NSLayoutConstraint.activate([
      addRemoveStack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      addRemoveStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      addRemoveStack.widthAnchor.constraint(equalToConstant: view.frame.width * 0.66)
    ])
    
    view.addSubview(gridView)
    NSLayoutConstraint.activate([
      gridView.topAnchor.constraint(equalToSystemSpacingBelow: addRemoveStack.bottomAnchor, multiplier: 2),
      gridView.leadingAnchor.constraint(equalTo: addRemoveStack.leadingAnchor),
      gridView.widthAnchor.constraint(equalTo: addRemoveStack.widthAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: gridView.bottomAnchor, multiplier: 2),
    ])
    
    view.addSubview(undoRedo)
    NSLayoutConstraint.activate([
      undoRedo.topAnchor.constraint(equalTo: addRemoveStack.topAnchor),
      undoRedo.leadingAnchor.constraint(equalToSystemSpacingAfter: addRemoveStack.trailingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: undoRedo.trailingAnchor, multiplier: 4),
    ])
    
    view.addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalTo: gridView.topAnchor),
      colorView.leadingAnchor.constraint(equalTo: undoRedo.leadingAnchor),
      colorView.trailingAnchor.constraint(equalTo: undoRedo.trailingAnchor),
      colorView.bottomAnchor.constraint(equalTo: gridView.bottomAnchor)
    ])
  }
}

extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    var cellCount = (gridViewModel.rowCount * gridViewModel.colCount)
    return cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = gridView.collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.layer.borderWidth = 2
    cell.layer.borderColor = UIColor.label.cgColor
    return cell
  }
}

extension MainViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Tapped \(indexPath)")
  }
}


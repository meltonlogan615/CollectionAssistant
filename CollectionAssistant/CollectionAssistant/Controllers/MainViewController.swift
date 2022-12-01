//
//  MainViewController.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import UIKit

class MainViewController: UIViewController {
  
  let addRemoveStack = AddRemoveStack()
  
  var gridView: UICollectionView! {
    didSet {
      gridView.dataSource = self
      gridView.delegate = self
      gridView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
      gridView.layer.borderColor = UIColor.label.cgColor
      gridView.layer.borderWidth = 4
      gridView.isScrollEnabled = false
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
    gridView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    
    addRemoveViewModel.setButtonActions(for: addRemoveStack.buttonStack)

    undoRedoViewModel.setButtonActions(for: undoRedo.buttonStack)
    
    colorViewModel.colors = colorView.colors
    colorViewModel.buttonStack = colorView.colorStack
    colorViewModel.setColorButtonActions()
    
    style()
    layout()
  }
}

extension MainViewController {
  func style() {
    addRemoveStack.translatesAutoresizingMaskIntoConstraints = false
    
    gridView.translatesAutoresizingMaskIntoConstraints = false
    
    undoRedo.translatesAutoresizingMaskIntoConstraints = false
    undoRedo.isUserInteractionEnabled = true
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
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: gridView.bottomAnchor, multiplier: 2),
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
    let cellCount = Int(gridViewModel.rowCount * gridViewModel.colCount)
    return cellCount
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = gridView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.layer.borderWidth = 2
    cell.layer.borderColor = UIColor.label.cgColor
    return cell
  }
}

extension MainViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = gridView.cellForItem(at: indexPath)
    if cell?.backgroundColor == nil {
      cell?.backgroundColor = .cyan
    } else {
      cell?.backgroundColor = nil
    }
  }
}

extension MainViewController {
  func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { _,_ in
      return self.createGroup()
    }
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 8
    layout.configuration = config
    return layout
  }

  func createGroup() -> NSCollectionLayoutSection {
    let rowHeight = CGFloat(1/gridViewModel.rowCount)
    let columnWidth = CGFloat(1/gridViewModel.colCount)
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1))

    let sectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(rowHeight))

    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(columnWidth),
                                          heightDimension: .fractionalHeight(1))

    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                   subitems: [item])

    let sectionAssembly = NSCollectionLayoutGroup.vertical(layoutSize: sectionSize,
                                                           subitems: [group])

    let section = NSCollectionLayoutSection(group: sectionAssembly)
    return section
  }
}


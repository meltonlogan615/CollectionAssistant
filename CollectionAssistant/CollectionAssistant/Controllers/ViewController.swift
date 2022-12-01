//
//  ViewController.swift
//  CollectionAssistant
//
//  Created by Logan Melton on 11/26/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .secondarySystemFill
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(keepMoving), userInfo: nil, repeats: false)
  }

  @objc
  func keepMoving() {
    let vc = MainViewController()
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
}


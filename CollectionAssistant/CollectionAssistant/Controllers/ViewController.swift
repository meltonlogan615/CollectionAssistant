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
    // Do any additional setup after loading the view.
    view.backgroundColor = .magenta
    
    _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(keepMoving), userInfo: nil, repeats: false)
  }
  
  @objc
  func keepMoving() {
    let vc = MainViewController()
    vc.modalTransitionStyle = .partialCurl
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }
  


}


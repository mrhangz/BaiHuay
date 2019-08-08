//
//  ViewController.swift
//  BaiHuay
//
//  Created by Teerawat Vanasapdamrong on 6/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var colorMe: ColorMe!
  
//  var count = 0
  
  @IBAction func buttonTapped() {
//    count += 1
    let number = Int.random(in: 0...999999)
    let string = String(format: "%06d", number)
    numberLabel.text = string
    button.setTitle("ใบ้หวยอีกครั้ง", for: .normal)
//    if count > 5 {
//      button.isEnabled = false
//    }
  }
  
  @IBAction func randomColor() {
    let redColor = CGFloat(Float.random(in: 0...1))
    let greenColor = CGFloat(Float.random(in: 0...1))
    let blueColor = CGFloat(Float.random(in: 0...1))
    let color = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    
    self.view.backgroundColor = color
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    colorMe.delegate = self
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    randomColor()
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      randomColor()
      buttonTapped()
    }
  }
}

extension ViewController: ColorMeProtocol {
  func didRandomColor(color: UIColor) {
    self.view.backgroundColor = color
  }
}


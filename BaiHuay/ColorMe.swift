//
//  ColorMe.swift
//  BaiHuay
//
//  Created by Teerawat Vanasapdamrong on 7/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

protocol ColorMeProtocol: class {
  func didRandomColor(color: UIColor)
}

class ColorMe: UIView {
  weak var delegate: ColorMeProtocol?
//  var randomColorButton: UIButton?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    let randomColorButton = UIButton(frame: self.bounds)
    randomColorButton.setTitleColor(.blue, for: .normal)
    randomColorButton.setTitle("Color Me", for: .normal)
    randomColorButton.translatesAutoresizingMaskIntoConstraints = true
//    guard let randomColorButton = randomColorButton else {
//      return
//    }
    self.addSubview(randomColorButton)
    randomColorButton.addTarget(self, action: #selector(randomColor), for: .touchUpInside)
  }
  
//  override func awakeFromNib() {
//    randomColorButton = UIButton(frame: self.frame)
//    randomColorButton?.setTitle("Color Me", for: .normal)
//    guard let randomColorButton = randomColorButton else {
//      return
//    }
//    self.addSubview(randomColorButton)
//    randomColorButton.addTarget(self, action: #selector(randomColor), for: .touchUpInside)
//  }
  
  @objc func randomColor() {
    let redColor = CGFloat(Float.random(in: 0...1))
    let greenColor = CGFloat(Float.random(in: 0...1))
    let blueColor = CGFloat(Float.random(in: 0...1))
    let color = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    delegate?.didRandomColor(color: color)
  }
}

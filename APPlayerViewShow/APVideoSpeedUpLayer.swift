//
//  APVideoSpeedUpLayer.swift
//  APPlayerViewShow
//
//  Created by Howard-Zjun on 2024/05/12.
//

import UIKit

class APVideoSpeedUpLayer: CALayer {

    lazy var backgroundLayer: CALayer = {
        let backgroundLayer = CALayer()
        backgroundLayer.frame = bounds
        backgroundLayer.backgroundColor = UIColor(hexValue: 0x000000, a: 0.3).cgColor
        return backgroundLayer
    }()
    
    lazy var img1Layer: CALayer = {
        let img1Layer = CALayer()
        img1Layer.frame = .init(x: 10, y: (frame.height - 30) * 0.5, width: 30, height: 30)
        img1Layer.contents = UIImage(named: "speedUp")?.cgImage
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0.5
        animation.repeatCount = 0
        img1Layer.add(animation, forKey: "1")
        return img1Layer
    }()
    
    lazy var textLayer: CATextLayer = {
        let textLayer = CATextLayer()
        textLayer.frame = .init(x: img1Layer.frame.maxX + 10, y: (frame.height - 20) * 0.5, width: frame.width - 20 - img1Layer.frame.maxX, height: 20)
        textLayer.string = "2.0倍速"
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.alignmentMode = .center
        textLayer.fontSize = 15
        return textLayer
    }()
    
    override var frame: CGRect {
        didSet {
            backgroundLayer.frame = bounds
            img1Layer.frame = .init(x: 10, y: (frame.height - 30) * 0.5, width: 30, height: 30)
            textLayer.frame = .init(x: img1Layer.frame.maxX + 10, y: 0, width: frame.width - 20 - img1Layer.frame.maxX, height: frame.height)
        }
    }
    
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        addSublayer(backgroundLayer)
        addSublayer(img1Layer)
        addSublayer(textLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

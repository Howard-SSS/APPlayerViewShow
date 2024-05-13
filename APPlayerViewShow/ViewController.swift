//
//  ViewController.swift
//  APPlayerViewShow
//
//  Created by Howard-Zjun on 2024/05/12.
//

import UIKit

class ViewController: UIViewController {

    var isFullScene: Bool = false {
        didSet {
            if #available(iOS 16.0, *) {
                self.setNeedsUpdateOfSupportedInterfaceOrientations()
                self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
                let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
                let geometry = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: isFullScene ? .landscapeRight : .portrait)
                scene.requestGeometryUpdate(geometry) { error in
                    print(error)
                }
            } else {
                UIDevice.current.setValue(isFullScene ? UIInterfaceOrientation.landscapeRight : UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
        }
    }
    
    lazy var videoView: APPlayerView = {
        let videoView = APPlayerView(frame: .init(x: 0, y: 40, width: view.width, height: 300))
        videoView.setVideo(resource: .init(name: "红色血脉", url: .init(string: "http://v3.huanqiucdn.cn/d1db0086vodtranscq1400174353/866b67d23701925920798981508/v.f30.mp4")!))
        videoView.delegate = self
        return videoView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(videoView)
    }
}

extension ViewController: APPlayerViewDelegate {
    
    func apPlayer(playerView: APPlayerView, orientDidChange isFullScreen: Bool) {
        self.isFullScene = isFullScreen
    }
}


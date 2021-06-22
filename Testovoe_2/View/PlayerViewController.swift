//
//  PlayerViewController.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//
import UIKit
import AVKit

class PlayerViewController: UIViewController {
    
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayer()
    }
    
    func videoPlayer() {
        let player = AVPlayer(url: URL(string: urlString)!)
                let controller = AVPlayerViewController()
        present(controller, animated: true) {  }
                controller.player = player
        addChild(controller)
                view.addSubview(controller.view)
                controller.view.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
                controller.player = player
                controller.showsPlaybackControls = true
                player.play()
    }
}

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
        openVideoPlayer()
    }
    
    func openVideoPlayer() {
        guard  let url = URL(string: urlString) else { return }
        let player = AVPlayer(url: url)
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

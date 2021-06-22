//
//  InstatViewController.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation
import UIKit

protocol InstatViewProtocol: AnyObject {
    func showMatchInfo(data: MatchData, date: String)
    func showLinks(linksTime1: MatchLinks, linksTime2: MatchLinks)
}

class InstatViewController: UIViewController {

    private lazy var presenter = InstatPresenter(with: self)
    private var videoLinksFirstTime = [MatchLink]()
    private var videoLinksSecondTime = [MatchLink]()
    @IBOutlet weak var tournamentLabel: UILabel!
    @IBOutlet weak var teamLeftLabel: UILabel!
    @IBOutlet weak var teamRightLabel: UILabel!
    @IBOutlet weak var scoreLeftLabel: UILabel!
    @IBOutlet weak var scoreRightLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colonLabel: UILabel!
    @IBOutlet weak var lookMatchLabel: UILabel!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var secondTimeLabel: UILabel!
    @IBOutlet weak var firstTimeStack: UIStackView!
    @IBOutlet weak var secondTimeStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadInfo()
        presenter.loadLinks()
        configureLabels()
        }
    
    private func configureLabels() {
        [teamRightLabel, teamLeftLabel].forEach {
            $0!.layer.cornerRadius = 10
            $0!.layer.masksToBounds = true
        }
    }
    
    func createButtonsForVideos(videosFirstTime: MatchLinks, videosSecondTime: MatchLinks) {
        for index in videosFirstTime.indices {
            let button = UIButton()
            button.tag = index
            button.setTitle(videosFirstTime[index].quality, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .highlighted)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(buttonTime1Pressed), for: .touchUpInside)
            firstTimeStack.addArrangedSubview(button)
        }
        
        for index in videosSecondTime.indices {
            let button = UIButton()
            button.tag = index
            button.setTitle(videosSecondTime[index].quality, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.setTitleColor(.white, for: .highlighted)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(buttonTime2Pressed), for: .touchUpInside)
            secondTimeStack.addArrangedSubview(button)
        }
    }
    
    @objc func buttonTime1Pressed(sender: UIButton) {
        let urlString = videoLinksFirstTime[sender.tag].url
        showPlayer(with: urlString)
    }
    
    @objc func buttonTime2Pressed(sender: UIButton) {
        let urlString = videoLinksSecondTime[sender.tag].url
        showPlayer(with: urlString)
    }
    
    func showPlayer(with urlString: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "PlayerVC") as? PlayerViewController else { return }
            secondViewController.urlString = urlString
            show(secondViewController, sender: nil)
    }
}


extension InstatViewController: InstatViewProtocol {
    func showLinks(linksTime1: MatchLinks, linksTime2: MatchLinks) {
        self.videoLinksFirstTime = linksTime1
        self.videoLinksSecondTime = linksTime2
        createButtonsForVideos(videosFirstTime: linksTime1, videosSecondTime: linksTime2)
    }
    
    func showMatchInfo(data: MatchData,date: String) {
        colonLabel.text = ":"
        lookMatchLabel.text = "Смотреть матч"
        firstTimeLabel.text = "1 тайм"
        secondTimeLabel.text = "2 тайм"
        tournamentLabel.text = "\(data.tournament.nameRus)"
        dateLabel.text = "\(date)"
        teamLeftLabel.text = "\(data.team1.nameRus)"
        teamRightLabel.text = "\(data.team2.nameRus)"
        scoreLeftLabel.text = "\(data.team1.score ?? 0)"
        scoreRightLabel.text = "\(data.team2.score ?? 0)"
    }
}

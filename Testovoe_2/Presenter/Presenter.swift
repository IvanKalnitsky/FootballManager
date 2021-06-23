//
//  Presenter.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

class InstatPresenter {
    
    weak var view: InstatViewProtocol?
    let sportID = 1
    let matchID = 1724836

    init(with view: InstatViewProtocol) {
        self.view = view
    }
    
    func loadLinks() {
        APIManager.shared.getMatchLinks(sportID: sportID, matchID: matchID) { links in
            DispatchQueue.main.async { [self] in
                guard let links = links else { return }
                let videoLinksTime1 = links.filter { $0.period == 1
                }
                let videoLinksTime2 = links.filter { $0.period == 2
                }
                self.view?.showLinks(linksTime1: videoLinksTime1, linksTime2: videoLinksTime2)
            }
        }
    }
    
    func loadInfo() {
        APIManager.shared.getMatchInfo(sportID: sportID, matchID: matchID) { info in
            DispatchQueue.main.async { [self] in
                guard let data = info else { return }
                let date = data.date.convertDateFormater()
                self.view?.showMatchInfo(data: data,date: "\(date)")
            }
        }
    }
}



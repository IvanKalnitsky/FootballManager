//
//  Presenter.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

class InstatPresenter {
    
    weak var view: InstatViewProtocol?
    let param = MatchInfoRequestBodyParams(pSport: 1, pMatchID: 1724836)
    
    init(with view: InstatViewProtocol) {
        self.view = view
    }
    
    func loadLinks() {
        APIManager.shared.getMatchLinks(sportID: param.pSport, matchID: param.pMatchID) { links in
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
        APIManager.shared.getMatchInfo(sportID: param.pSport, matchID: param.pMatchID) { info in
            DispatchQueue.main.async { [self] in
                guard let data = info else { return }
                let date = convertDateFormater(data.date)
                self.view?.showMatchInfo(data: data,date: "\(date)")
            }
        }
    }
    
    private func convertDateFormater(_ date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
            let newDate = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.string(from: newDate!)
        }
}

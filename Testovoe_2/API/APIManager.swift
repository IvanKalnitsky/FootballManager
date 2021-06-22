//
//  APIManager.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

enum APIType {
    case getMatchInfo
    case getMatchLinks
    
    var baseURL: URL {
      return URL(string: "https://api.instat.tv/test/")!
    }
    
    var headers: [String: String] {
      switch self {
      case .getMatchInfo, .getMatchLinks:
        return ["Content-Type": "application/json"]
      }
    }
    
    var path: String {
        switch self {
        case .getMatchInfo:
            return "data"
        case .getMatchLinks:
            return "video-urls"
        }
    }
    
    var method: String {
        switch self {
        case .getMatchInfo, .getMatchLinks:
            return "POST"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        return request
    }
}

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func getMatchInfo(sportID: Int, matchID: Int, completion: @escaping (MatchData?) -> Void) {
        var request = APIType.getMatchInfo.request
        let json = MatchInfoRequestBody(proc: "get_match_info", params: MatchInfoRequestBodyParams(pSport: sportID, pMatchID: matchID))
        let jsonData = try? JSONEncoder().encode(json)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let info = try? JSONDecoder().decode(MatchData.self, from: data)
                completion(info)
        }
        task.resume()
    }
    
    func getMatchLinks(sportID: Int, matchID: Int, completion: @escaping (MatchLinks?) -> Void) {
        var request = APIType.getMatchLinks.request
        let json = MatchLinksRequestBody(matchID: matchID, sportID: sportID)
        let jsonData = try? JSONEncoder().encode(json)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let links = try? JSONDecoder().decode(MatchLinks.self, from: data)
            completion(links)
        }
        task.resume()
    }
}


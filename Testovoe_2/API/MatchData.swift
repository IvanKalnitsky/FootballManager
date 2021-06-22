//
//  MatchData.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

// MARK: - MatchData
struct MatchData: Decodable {
    let access, hasVideo: Bool
    let tournament: Team
    let live: Bool
    let team2: Team
    let date: String
    let calc, storage, sub: Bool
    let team1: Team

    enum CodingKeys: String, CodingKey {
        case access
        case hasVideo = "has_video"
        case tournament, live, team2, date, calc, storage, sub, team1
    }
}

// MARK: - Team
struct Team: Decodable {
    let id: Int
    let nameRus, nameEng: String
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nameRus = "name_rus"
        case nameEng = "name_eng"
        case score
    }
}

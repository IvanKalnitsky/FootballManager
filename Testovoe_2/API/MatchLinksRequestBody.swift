//
//  MatchLinksRequestBody.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

// MARK: - MatchLinksRequestBody
struct MatchLinksRequestBody: Encodable {
    let matchID, sportID: Int

    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case sportID = "sport_id"
    }
}

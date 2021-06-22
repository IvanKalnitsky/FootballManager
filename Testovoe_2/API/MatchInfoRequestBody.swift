//
//  MatchInfoRequestBody.swift
//  Testovoe_2
//
//  Created by macbookp on 21.06.2021.
//

import Foundation

// MARK: - MatchInfoRequestBody
struct MatchInfoRequestBody: Encodable {
    let proc: String
    let params: MatchInfoRequestBodyParams
}

// MARK: - Params
struct MatchInfoRequestBodyParams: Encodable {
    let pSport, pMatchID: Int

    enum CodingKeys: String, CodingKey {
        case pSport = "_p_sport"
        case pMatchID = "_p_match_id"
    }
}

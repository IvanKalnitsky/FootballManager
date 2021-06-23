//
//  DateFormatter.swift
//  Testovoe_2
//
//  Created by macbookp on 23.06.2021.
//

import Foundation

extension String {
    func convertDateFormater() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
            let newDate = dateFormatter.date(from: self)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return  dateFormatter.string(from: newDate!)
    }
}

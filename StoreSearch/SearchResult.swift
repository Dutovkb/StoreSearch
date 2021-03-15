//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Кирилл Дутов on 12.03.2021.
//

import UIKit

class SearchResult {
    var name = ""
    var artistName = ""
    var artworkSmallURL = ""
    var artworkLargeURL = ""
    var storeURL = ""
    var kind = ""
    var currency = ""
    var price = 0.0
    var genre = ""
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
 return lhs.name.localizedStandardCompare(rhs.name) == .orderedAscending
}

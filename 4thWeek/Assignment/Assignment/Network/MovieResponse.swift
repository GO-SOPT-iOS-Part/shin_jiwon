//
//  MovieResponse.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/17.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Results]
}

struct Results: Codable {
    let poster_path: String?
    let title: String
}

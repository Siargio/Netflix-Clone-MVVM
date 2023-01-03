//
//  YoutubeSearchResponse.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 3.01.23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}

//
//  PostModel.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 16/08/22.
//

import Foundation

struct PostModel: Encodable, Decodable {
    
    var caption: String
    var likes: [String: Bool]
    var postId: String
    var ownerId: String
//    var username: String
    var mediaURL: String
    var date: Double
    var likeCount: Int
}

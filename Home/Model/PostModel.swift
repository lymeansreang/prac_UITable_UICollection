//
//  PostModel.swift
//  ReanTable
//
//  Created by Rithiya on 16/8/24.
//

import Foundation

struct PostModel {
    let profile: String
    let name: String
    let hour: String
    let description: String
    let imagePosting: String
    let emojiLike: String
    let emojiLove: String
    let emojiHappy: String
    let totalLike: String
    let commentAmount: String
    let shareAmount: String
}

struct PostStoryModel{
    let profile : String
}

struct userStoryModel {
    let profile: String
    let name: String
    let photo: String
}

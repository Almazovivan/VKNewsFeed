//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Ivan Almazov on 15/01/2021.
//  Copyright (c) 2021 Ivan Almazov. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}

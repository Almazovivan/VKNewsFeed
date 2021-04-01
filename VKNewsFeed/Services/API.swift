//
//  API.swift
//  VKNewsFeed
//
//  Created by Ivan Almazov on 15/01/2021.
//  Copyright (c) 2021 Ivan Almazov. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.92"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}

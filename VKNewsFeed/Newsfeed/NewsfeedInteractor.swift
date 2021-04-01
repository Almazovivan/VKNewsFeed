//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Ivan Almazov on 15/01/2021.
//  Copyright (c) 2021 Ivan Almazov. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch request {
    case .getNewsfeed:
        service?.getFeed(completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    case .getUser:
        service?.getUser(completion: { [weak self] (user) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: user))
        })
    case .revealPostIds(let postId):
        service?.revealPostIds(forPostId: postId, completion: { [weak self] (revealedPostIds, feed) in
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    case .getNextBatch:
        self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentFooterLoader)
        service?.getNextBatch(completion: { (revealedPostIds, feed) in
            self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealdedPostIds: revealedPostIds))
        })
    }
  }
}

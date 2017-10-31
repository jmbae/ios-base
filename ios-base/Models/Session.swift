//
//  Session.swift
//  ios-base
//
//  Created by Juan Pablo Mazza on 11/8/16.
//  Copyright © 2016 Rootstrap. All rights reserved.
//

import Foundation

class Session: NSObject, NSCoding {
  var uid: String?
  var client: String?
  var accessToken: String?
  var expiry: Date?

  init(uid: String? = nil, client: String? = nil, token: String? = nil, expires: Date? = nil) {
    self.uid = uid
    self.client = client
    self.accessToken = token
    self.expiry = expires
  }

  required init(coder aDecoder: NSCoder) {
    self.uid = aDecoder.decodeObject(forKey: "session-uid") as? String
    self.client = aDecoder.decodeObject(forKey: "session-client") as? String
    self.accessToken = aDecoder.decodeObject(forKey: "session-token") as? String
    self.expiry = aDecoder.decodeObject(forKey: "session-expiry") as? Date
  }

  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.uid, forKey: "session-uid")
    aCoder.encode(self.client, forKey: "session-client")
    aCoder.encode(self.accessToken, forKey: "session-token")
    aCoder.encode(self.expiry, forKey: "session-expiry")
  }
  
  // MARK: - Parser
  class func parse(from headers: [String: Any]) -> Session {
    var loweredHeaders = headers
    loweredHeaders.lowercaseKeys()
    var expiry: Date?
    if let loweredHeaders = loweredHeaders as? [String: String] {
      if let expiryString = loweredHeaders[APIClient.HTTPHeader.expiry.rawValue],
         let expiryNumber = Double(expiryString) {
        expiry = Date(timeIntervalSince1970: expiryNumber)
      }
      return Session(uid:     loweredHeaders[APIClient.HTTPHeader.uid.rawValue],
                     client:  loweredHeaders[APIClient.HTTPHeader.client.rawValue],
                     token:   loweredHeaders[APIClient.HTTPHeader.token.rawValue],
                     expires: expiry
      )
    }
    return Session()
  }
}

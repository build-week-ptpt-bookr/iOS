//
//  LoginProtocol.swift
//  Bookr
//
//  Created by Aaron on 8/23/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func userAttemptedToLogIn(_:[String:String])
}

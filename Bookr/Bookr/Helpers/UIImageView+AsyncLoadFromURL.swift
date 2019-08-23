//
//  UIImageView+AsyncLoadFromURL.swift
//  Bookr
//
//  Created by Joshua Kaunert on 8/22/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
